class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  validates :nickname, :first_name, :last_name, :birthday, :password_confirmation, presence: true
  validates :password, presence: true,
                       # 6文字以上の英数字のみ可
                       format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: 'is must NOT contain any other characters than alphanumerics.' }
  validates :email, presence: true,
                    # 重複不可
                    uniqueness: { case_sensitive: false },
                    # @を挟んだemailの形になっているか
                    # /^\S+@\S+\.\S+$/   /\A[a-z0-9]+\z/i  /^[a-zA-Z0-9]+$/
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'is must NOT contain any other characters than alphanumerics.' }
  validates :first_name_kana, :last_name_kana, presence: true,
                                               # カタカナのみ使用可
                                               format: { with: /\A([ァ-ン]|ー)+\z/, message: 'is must NOT contain any other characters than alphanumerics.' }
end
