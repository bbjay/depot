class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  validates_presence_of :title
end
