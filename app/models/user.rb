class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, uniqueness: true, length: {in: 2..20}
  validates :introduction, length: {maximum:50}

  has_many :books, dependent: :destroy
  attachment :profile_image

end
