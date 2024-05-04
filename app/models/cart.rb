class Cart < ApplicationRecord
    belongs_to :user
    has_many :cart_products, dependent: :destroy
    has_many :products, through: :cart_products

    def total_price
      cart_products.sum(:subtotal)
    end

    def add_product(product, quantity)
      current_item = cart_products.find_by(product_id: product.id)
      if current_item
        current_item.quantity += quantity
      else
        current_item = cart_products.build(product_id: product.id, quantity: quantity)
      end
      current_item.save
    end

  end