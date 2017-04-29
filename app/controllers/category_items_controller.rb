$searchRes = 0
$searchCatId = 0
$itemsS = nil
$filtersS = nil
$ColourArray = ['Red','Green', 'Pink', 'Black' , 'White']

class CategoryItemsController < ApplicationController

def new
end

def show


     if $searchRes == 2   
	    @items = $itemsS 
		@filters = $filtersS   
		@ColourArr = $ColourArray	
		$searchRes = 0
	 
	 else 
		$searchCatId = params[:iid]
		@items = Item.findwithcategory(params[:iid])   
	    @filters = 	CategoryFilter.findByCat(params[:iid])
		$itemsS = @items 
		$filtersS = @filters  
	    @ColourArr = $ColourArray	
	end
    
    @it = [:items => @items, :filters => @filters]
	
	respond_to do |format|
	 	format.html { render :show }
     	format.json { render @it, status: :created}
 	end
end

def searchCat
	#$ColourArray.each do |c|
		#puts params["Color_"+c]
	#end
	#@arr = CarCat.order(:id)
	#$count = countOfArray(CarCat.order(:id))
	     
	    filterArr = CategoryFilter.findByCat($searchCatId)
		arrC = $ColourArray
        arr = ItemSpec.findAll(filterArr , params , arrC)
		arrOfItems=[]
		arr.each do |c|
		arrOfItems.push(c.item_id) 
	    end 

		temparr = arrOfItems.find_all { |e| arrOfItems.count(e) > 1}

		
		#puts "hello000"
		#puts filterArr.size
=begin
		sizeofparams = 0 
		sizeofcolorsparams = 0
		filterArr.each do |x| 
		
		
		if x.typeOfLabel == "checkBox"
		
	   $ColourArray.each do |c|
		if params["Color_"+c] != nil
	      sizeofcolorsparams += 1 
       end 
		end 
		
		elsif x.typeOfLabel == "text"
         if params[x.nameOfLabel] != ""
		 sizeofparams += 1
		 end 
          end		
		
		end 
		
		
		puts sizeofparams 
		puts sizeofcolorsparams
		
		
		
		
		
		if sizeofparams > 0 
 		
		if sizeofcolorsparams > 0
		  sizeofparams += 1
		else 
		   
		end
		
		
		
		
		end 
		
		
		#if arrOfItems.size != 1
		
		
		#if temparr.size != 0 
		#arrOfItems = temparr
		#end 
		
		
		#end
		
		
		#puts arrOfItems
		
	    $itemsS = Item.where("id IN (?) and category_id = (?)", arrOfItems,$searchCatId)		
		$searchRes = 2
		
=end
		puts "result is:"
		#filterArr.each do |x| 
		 puts arrOfItems
	    #end	
	    $itemsS = Item.where("id IN (?) and category_id = (?)", arrOfItems,$searchCatId)		
	$searchRes = 2
	

    redirect_to showcat_path(:iid =>$searchCatId)
         
end 

private
  def countOfArray(arr)
    
	$c = 0
	for element in arr do
	 $c += 1 
    end
	return $c
  end



end