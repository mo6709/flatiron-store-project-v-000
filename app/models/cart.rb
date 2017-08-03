class Cart < ActiveRecord::Base
    has_many :line_items
    has_many :items, :through => :line_items
    belongs_to :user
    
    def total
        sum = 0
    	self.line_items.each do |line_item|
            sum += line_item.item.price * line_item.quantity
        end
         sum
    end

    def add_item(item)
        item_id = item.to_i
    	if self.item_ids.include?(item_id)
    		line_item = self.line_items.find_by(:item_id => item_id)
    		line_item.quantity += 1
    		line_item 
    	else	
	    	item = Item.find_by(:id => item_id)
	    	self.line_items.build(:cart => self, :item => item)
        end
    end

    def checkout
    	if self.status.nil?
	    	self.line_items.each do |line_item|
	    		new_inventory = line_item.item.inventory - line_item.quantity
	    	    line_item.item.update(:inventory => new_inventory) 
	    	end
	    	user = self.user
	    	user.current_cart_id = nil
            user.save

	    	self.status = "submitted"
	    	self.save
	    	self.status
	    else
	    	"This cart has being already submitted"
	    end	
    end

end