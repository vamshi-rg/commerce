class Order < ActiveRecord::Base
  attr_accessible :customer_id, :item_id
  belongs_to :item
  belongs_to :customer
end
