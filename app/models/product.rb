class Product < ApplicationRecord
    validates :name, :price, presence: true

    def to_s
        name
    end

    def to_builder
        Jbuilder.new do |product|
          product.price stripe_price_id
          product.quantity 1
        end
    end
    
end
