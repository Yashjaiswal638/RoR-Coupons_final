class CheckoutController < ApplicationController

    def create
      if current_employee.amount == nil
        current_employee.amount = 0
      end
      session[:cart].each do |n|
          current_employee.amount -= Product.find(n).price
          current_employee.save
      end
      session[:cart] = nil
      redirect_to success_url


        # product = Product.find(params[:id])
        # product.count += 1
        # product.save
        # @session = Stripe::Checkout::Session.create({
        #     payment_method_types: ['card'],
        #     line_items: [{
        #         name: product.name,
        #         amount: product.price,
        #         description: 'test p',
        #         currency: 'usd',
        #         quantity: 1
        #     }],
        #     mode: 'payment',
        #     success_url: root_url,
        #     cancel_url: root_url,
        #   })
        # respond_to do |format|
        #     format.js
        # end
        # @session = Stripe::Checkout::Session.create(
        #     line_items: [{
        #       price_data: {
        #         currency: 'usd',
        #         unit_amount: product.price,
        #         product_data: {
        #           name: product.name,
        #           description: 'Comfortable cotton t-shirt',
        #           images: ['https://png.pngtree.com/png-clipart/20210312/original/pngtree-mobile-phone-png-smartphone-camera-mockup-png-image_6067590.jpg'],
        #         },
        #       },
        #       quantity: 1,
        #     }],
        #     mode: 'payment',
        #     success_url: root_url,
        #     cancel_url: root_url,
        #   )

        # product = Stripe::Product.create({
        #     name: 'product.name',
        #     description: 'Comfortable cotton t-shirt',
        # })

        # price = Stripe::Price.create({
        #     product: product.id,
        #     unit_amount: 100,
        #     currency: 'usd',
        # })

        # @session = Stripe::Checkout::Session.create(
        #     line_items: [{
        #       price: price.id,
        #       quantity: 1,
        #       }],
        #     mode: 'payment',
        #     success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
        #     cancel_url: root_url,
        # )

        # if params[:session_id].present? 
        #   # session.delete(:cart)
        #   session[:cart] = [] # empty cart = empty array
        #   @session_with_expand = Stripe::Checkout::Session.retrieve({ id: params[:session_id], expand: ["line_items"]})
        #   @session_with_expand.line_items.data.each do |line_item|
        #     product = Product.find_by(stripe_product_id: line_item.price.product)
        #   end
        # end


        # respond_to do |format|
        #     format.js
        # end
    end

    def success
      # session[:cart].delete()
      # |n| session[:cart].delete(n)
      # session[:cart].each { |n| session[:cart].delete(n) }
      # reset_session
      session[:cart] = nil
      p 'ok'
    end
    

    #   def cancel
    #   end


    # def initialize_session
    #   session[:cart] ||= [] # empty cart = empty array
    # end
  

end