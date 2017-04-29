class ItemsController < ApplicationController
  before_action :require_user, only: [:show, :new, :markavailable, :create, :edit, :update, :destroy]
	def index
	  @item = Item.find(params[:id])
    @item_attachment = @item.item_attachments.all
    
    labels = []
    @itemSpecs = ItemSpec.findbyItem(params[:id])
    @itemSpecs.each do |is|
         labels.push(CategoryFilter.find(is.category_filter_id).nameOfLabel)
    end
    @labels = labels
    @user = User.find(@item.user_id) 
end

def show
	  @item = Item.find(params[:id])
end

def new
	@user = User.find(params[:user_id])
  @filters =  CategoryFilter.findByCat(@user.categories_id)
  
  @item  = @user.items.build
  @item_attachment = @item.item_attachments.build
end
 
def markavailable
    @item = Item.find(params[:id])
    if (params[:iava] == '0')  #user want to make it available
      @item.update(:item_available => '1')
    else
      #user want to make it not available
      @item.update(:item_available => '0')
    end
    redirect_to user_path(:id => params[:user_id])

end

def create
  @user = User.find(params[:user_id])
 	@item = @user.items.create(item_params)
  @filters =  CategoryFilter.findByCat(@user.categories_id)
  
  
  if @item.save
        params[:item_attachments]['image'].each do |a|
                  @item_attachment = @item.item_attachments.create!(:image => a)
        end
        
        @filters.each do |fi| 
            @itemSpecs = ItemSpec.create( :item_id => @item.id, :category_filter_id => fi.id, :value => params[fi.nameOfLabel]  )
        end
  		  redirect_to user_path(:id => params[:user_id])
	else
  		render :action => 'new'
	end
  	  	
end

def edit
  @item = Item.find(params[:id])
  @itemSpecs = ItemSpec.findbyItem(@item.id)
    @user = User.find(params[:user_id])
  @filters =  CategoryFilter.findByCat(@user.categories_id)

end
	 
def update
  @user = User.find(params[:user_id])
  @item = Item.find(params[:id])

  @filters =  CategoryFilter.findByCat(@user.categories_id)
  @itemSpecs = ItemSpec.findbyItem(@item.id)

  if @item.update(item_params)
      k =0
      @filters.each do |fi| 
            @itemSpecs[k].update(:value => params[fi.nameOfLabel] )
            k = k+1
      end
      redirect_to user_path(:id => params[:user_id])
  else
    render 'edit'
  end
end

def destroy
  @user = User.find(params[:user_id])
  @item = Item.find(params[:id])

  @itemSpecs = ItemSpec.findbyItem(@item.id)

  @itemSpecs.each do |is|
              is.destroy
          end
  @item.destroy

  
  redirect_to user_path(:id => params[:user_id])
end

private
def item_params
	    params.require(:item).permit(:item_name,:item_desc,:item_price,:category_id,:item_available, :item_per, :item_maxp, :item_minp)
end
end
