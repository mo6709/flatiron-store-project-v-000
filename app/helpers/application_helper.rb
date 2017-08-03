module ApplicationHelper
	def button_add_to_cart(item_id)
	    user = current_user.try(:current_cart)
	    status = user.try(:status)	
		if user_signed_in? && status != "submited"
			button_to('Add to Cart', line_items_path(:item_id => item_id))
		end
	end

	def number_to_currency(price)
		"$#{price.to_f/100}"
	end
end
