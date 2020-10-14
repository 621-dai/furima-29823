class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :estimated_shipping_date

  belongs_to :user 
  has_one :purchase 
  has_one_attached :image

  with_options presence: true do
    validates :name, :introduction, :image
    validates :category_id, :condition_id, :shipping_cost_id, :estimated_shipping_date_id, :prefecture_id,
               numericality: { only_integer: true, greater_than: 1, message: "is invalid"}
    validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width numbers."} 
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999, 
               message: "is invalid. Input half-width numbers and Price must be between ¥300 and ¥9,999,999."}
  end
end