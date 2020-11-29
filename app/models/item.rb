class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :shopping_prefecture
  belongs_to_active_hash :days

  validates :name, :introduction, :category_id, :condition_id, :shopping_prefecture_id, :days_id, :price, presence: true

  validates :category_id, numericality: {other_than: 1 }
  validates :condition_id, numericality: {other_than: 1 }
  validates :postage_id, numericality: {other_than: 1 }
  validates :shopping_prefecture_id, numericality: {other_than: 1 }
  validates :days_id, {other_than: 1 }

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image
end
