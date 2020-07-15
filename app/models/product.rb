class Product < ApplicationRecord
    validates :name, present: true
end
