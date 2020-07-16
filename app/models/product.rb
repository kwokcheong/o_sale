class Product < ApplicationRecord

    validates :name, presence: true, allow_nil: false
    validates :description, presence: true, length: {minimum: 5}, allow_nil: false
    validates :price, numericality: {
        greater_than_or_equal_to: 0.0
    }
end

