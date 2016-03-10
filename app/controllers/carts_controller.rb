class CartsController < ApplicationController

	def new
	end

	def checkout
		current_cart.line_items.each do |line_item|
			line_item.update_item_inventory
		end
		current_cart.destroy
		redirect_to cart_path(current_cart), notice: "Thank you for your order"
	end

end
