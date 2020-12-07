class ItemPurchase
  include ActiveMmodel::Model
  attr_accessor : :postal_code, :prefecture, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid. Input half-width characters."}
  end

  validates :prefecture, numericality: {other_than: 1, message: "can't be blank" }

  def save
    Purchase.create(user_id: user.id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end


