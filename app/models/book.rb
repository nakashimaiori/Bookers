class Book < ApplicationRecord

# オプショナルtrue
  belongs_to :genre
  validates :title, presence: true
  validates :body, presence: true
end
