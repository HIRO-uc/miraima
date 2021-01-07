class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :type
  has_one :profile
  has_one :career
  validates :password,          format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i, message: 'は半角英数字どちらも含む8文字以上で入力してください' }
  with_options presence: true do
    validates :nickname
    validates :type_id,   numericality: { other_than: 0, message: 'を選択してください' }
    validates :last_name,       format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :first_name,      format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :birth_date
  end
end
