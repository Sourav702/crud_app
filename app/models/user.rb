class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true, length: { is: 10 }

  def self.search(search)
    if search
      User.where("name LIKE ? OR email LIKE ?","%#{search}%","%#{search}%")
    else
      all
    end
  end
end
