class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product_id, :user_id, :description, :rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
end
