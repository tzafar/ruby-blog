class Article < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, :allow_blank => false, :allow_nil => false, :length => {minimum: 3, maximum: 100}
  validates :body, presence: true, :allow_blank => false, :allow_nil => false, :length => {minimum: 10, maximum: 200}
end
