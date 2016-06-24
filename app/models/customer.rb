class Customer < ActiveRecord::Base
  attr_accessible :city, :email, :name, :pincode
  validates :city, :email, :name, :presence => true
  validates :pincode, length: { is: 6 }, :allow_blank => true
  has_many :orders
  has_many :items, through: :orders
end
