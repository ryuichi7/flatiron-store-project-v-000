class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_many :items, through: :line_items


	def total
		line_items.joins(:item).sum("quantity * price")
	end
	# 	@total = line_items.collect do |line_item|
	# 		line_item.quantity * line_item.item.price
	# 	end
	# 	@total.inject(:+)
	# end
	
	def add_item(item_id)

		#if line item already exists, then update, otherwise create a new one
	# 	if @line_item = line_items.find_by(item_id: item_id)
	# 		@line_item.update(quantity: @line_item.quantity + 1)
	# 		@line_item
	# 	else
	# 		line_items.new(item_id: item_id)
	# 	end
		line_items.find_or_initialize_by(item_id: item_id)
	end
		
	
end
