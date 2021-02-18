class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories
  validates :title,
            presence: true,
            uniqueness: { message: "Category name already exists" },
            length: { minimum: 3, maximum: 12 },
            format: { with: /\A[a-zA-Z]+\z/, message: 'Category title should only cotains letters' }
end
