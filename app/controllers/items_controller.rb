class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.create(:name => params[:name], :price => params[:price])
		
		if @item.save
	      redirect_to action: :index
	    else
	      render :new
	    end 
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update_attributes(:name => params[:item][:name], :price => params[:item][:price])
			redirect_to action: :show
		else
			render :edit
		end
	end

	def destroy
		@item = Item.find(params[:id])
  		@item.destroy
  		redirect_to action: :index
	end

end
