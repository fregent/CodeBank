class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :snippets, dependent: :destroy
  has_many :directories, dependent: :destroy
  has_many :likes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
