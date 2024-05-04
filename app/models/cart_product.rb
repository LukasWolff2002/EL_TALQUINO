class CartProduct < ApplicationRecord
    belongs_to :cart
    belongs_to :product

    before_save :set_subtotal

    def set_subtotal
      self.subtotal = quantity * product.price
    end
  end