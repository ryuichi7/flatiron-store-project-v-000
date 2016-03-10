class LineItemsController < ApplicationController

	def create
		current_user.current_cart = Cart.create unless !!current_cart
		@line_item = current_cart.add_item(params[:item_id])
		@line_item.add_quantity unless @line_item.new_record?
		current_cart.save

		redirect_to cart_path(current_cart)
	end





end
