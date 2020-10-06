class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname, :birthday, :password_confirmation
    validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."} #ユーザー本名は全角（漢字・ひらがな・カタカナ）
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, 
                         message: 'is must NOT contain any other characters than alphanumerics.'} # 6文字以上の英数字のみ可
    validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, 
               message: "is invalid. Input full-width katakana characters."} # カタカナのみ使用可
    validates :email, uniqueness: { case_sensitive: false }, # 重複不可 # @を挟んだemailの形になっているか
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'is must NOT contain any other characters than alphanumerics.'}
  end  
end
