class Api::V1::ApiController < ApplicationController

	#get all cateogries listed registerd at the system
	def getAllCategories
	 	@categories = Category.all
	 	
	 	render json: @categories
	 	#head :no_content
	end

	#get items listed in on specific category (given category id)
	def getItems
		@items = Item.findbyCat(params[:id])
		@item_attach = ItemAttachment.findbyItemId(params[:id])
		#@tosend = [:items => @items, :items_attach => @item_attach]

		render json: @items
		#head :no_content
	end

	#get specific item info (given item id)
	def getItemInfo
		@item = Item.find(params[:id])
		render json: @item
	end

	#get name of labels and type (given category id)
	def getCategoryFilter
		@catf = CategoryFilter.findByCat(params[:id])
		render json: @catf
	end

	#get specific vendor info (given vendor id)
	def getVendorInfo
		@item = Item.find(params[:id])
		@vendor = User.find(@item.user_id)
		render json: @vendor
	end

end
