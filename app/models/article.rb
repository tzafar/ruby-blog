class Article < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :title, presence: true, :allow_blank => false, :allow_nil => false, :length => { minimum: 3, maximum: 100 }
  validates :body, presence: true, :allow_blank => false, :allow_nil => false, :length => { minimum: 10, maximum: 200 }
end
