class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days

  validates :name, :introduction, :category_id, :image, :condition_id, :prefecture_id, :days_id, :postage_id, :price, presence: true

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :days_id
  end

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image
end
