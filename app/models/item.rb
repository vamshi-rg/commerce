class Item < ActiveRecord::Base
  attr_accessible :name, :price
  validates :name, :price, presence: true
  validates :price, inclusion: {:in => 0..1000000}
  has_many :orders
  has_many :customers, through: :orders
end
