class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  validates_presence_of :title

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  private
  	def ensure_not_referenced_by_any_line_item
  		if line_items.empty?
  			return true
  		else
  			errors.add(:base, 'Line Items present')
  			return false
  		end
  	end
end
