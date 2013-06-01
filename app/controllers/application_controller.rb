class ApplicationController < ActionController::Base
	protect_from_forgery
	helper_method :current_cart

	private
	def current_cart
		Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		cart
	end
end

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  "#{html_tag}".html_safe
end
