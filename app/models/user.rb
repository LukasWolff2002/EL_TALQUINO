class User < ApplicationRecord
    has_secure_password
    has_many :addresses
    has_one :cart
  end