class AddPriceToTheLineItem < ActiveRecord::Migration
  def change
  	add_column :line_items, :price, :decimal 

  	LineItem.all.each do |line_item| 

      product = Product.find( id: line_item.product_id )
      line_item.price = product.price
  		
  	end
  end
end
