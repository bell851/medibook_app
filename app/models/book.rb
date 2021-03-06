class Book < ApplicationRecord
    validates :title, presence: true, length: { maximum: 30}
    validates :description, length: { maximum: 140}
end
