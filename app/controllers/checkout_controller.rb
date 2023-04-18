class CheckoutController < ApplicationController

    def create
        product = Product.find(params[:id])
        product.count += 1
        product.save
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

        product = Stripe::Product.create({
            name: product.name,
            description: 'Comfortable cotton t-shirt',
        })

        price = Stripe::Price.create({
            product: product.id,
            unit_amount: 100,
            currency: 'usd',
        })

        @session = Stripe::Checkout::Session.create(
            line_items: [{
              price: price.id,
              quantity: 1,
              }],
            mode: 'payment',
            success_url: root_url,
            cancel_url: root_url,
        )


        respond_to do |format|
            format.js
        end
    end

end