class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user
  has_one :purchase

  with_options presence: true do
    validates :name, :introduction
    validates :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :estimated_shipping_date_id, 
               numericality: { other_than: 1 } 
    validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width numbers."} 
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999, 
               message: "is invalid. Price must be between ¥300 and ¥9,999,999."}
  end
end