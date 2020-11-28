class User < ApplicationRecord
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
    with_options presence: true do
      validates :nickname
      validates :birth_day
      with_options format: { with: /\A[ぁ-ん一-龥]+\z/, message: 'Full-width characters' } do
        validates :first_name
        validates :last_name
      end
      with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width characters' } do
        validates :first_name_kana
        validates :last_name_kana
      end
    end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :prototypes, dependent: :destroy
  has_many :items, dependent: :destroy
  
end
