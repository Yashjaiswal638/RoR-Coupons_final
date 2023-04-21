class GcardsController < ApplicationController
  require 'securerandom'
  before_action :set_gcard, only: %i[ show edit update destroy ]

  # GET /gcards or /gcards.json
  def index
    @gcards = Gcard.all
  end

  # GET /gcards/1 or /gcards/1.json
  def show
  end

  # Redeem Gift Card
  def redeem
    if current_employee.amount == nil
      current_employee.amount = 0
    end
    @gcard = Gcard.find(params[:gcard_id])
    current_employee.amount += @gcard.amount
    @gcard.amount = 0
    @gcard.save
    current_employee.save
    redirect_to @gcard
  end

  # GET /gcards/new
  def new
    @gcard = Gcard.new
  end

  # GET /gcards/1/edit
  def edit
  end

  # POST /gcards or /gcards.json
  def create
    @gcard = Gcard.new(gcard_params)
    # @gcard.user_id = current_user.id
    if !Employee.find_by(email:@gcard.email)
      emp = Employee.create(email: @gcard.email, password:"12345678", password_confirmation:"12345678")
      emp.save
    else
      emp = Employee.find_by(email:@gcard.email)
    end
    @gcard = Gcard.new(gcard_params.merge!(user: current_user, employee: emp))
    @gcard.code = SecureRandom.alphanumeric(50)

    respond_to do |format|
      if @gcard.save
        if current_user.amount >= @gcard.amount
          current_user.amount = current_user.amount - @gcard.amount
          current_user.save
          format.html { redirect_to gcard_url(@gcard), notice: "Gcard was successfully created." }
          format.json { render :show, status: :created, location: @gcard }
          # flash.alert = "Article was created successfully."
          # redirect_to @gcard
        else
          @gcard.destroy
          Employee.last.destroy
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @gcard.errors, status: :unprocessable_entity }
          # flash[:notice] = "Article was created successfully."
          # redirect_to @gcard

        end

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gcards/1 or /gcards/1.json
  def update
    respond_to do |format|
      if @gcard.update(gcard_params)
        format.html { redirect_to gcard_url(@gcard), notice: "Gcard was successfully updated." }
        format.json { render :show, status: :ok, location: @gcard }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gcards/1 or /gcards/1.json
  def destroy
    @gcard.destroy

    respond_to do |format|
      format.html { redirect_to gcards_url, notice: "Gcard was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gcard
      @gcard = Gcard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gcard_params
      params.require(:gcard).permit(:amount, :email, :description)
    end
end
