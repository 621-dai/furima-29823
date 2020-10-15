class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :street_name, :building, :phone_number, :token, :purchase_id

  with_options presence: true do
    validates :city, :street_name, :user_id, :item_id, :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { only_integer: true, greater_than: 1, message: "is invalid" }
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width numbers."} 
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(purchase_id: purchase.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, 
                    street_name: street_name, building: building, phone_number: phone_number)
  end

end