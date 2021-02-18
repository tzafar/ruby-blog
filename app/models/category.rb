class Category < ApplicationRecord
  validates :title,
            presence: true,
            uniqueness: { message: "Category name already exists" },
            length: { minimum: 3, maximum: 12 },
            format: { with: /\A[a-zA-Z]+\z/, message: 'Category title should only cotains letters' }
end
