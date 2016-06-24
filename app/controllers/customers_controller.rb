class CustomersController < ApplicationController

	def index
		@customers = Customer.all
	end

	def new
		@customer = Customer.new
	end

	def create
		@customer = Customer.create(:name => params[:name], :email => params[:email], :city => params[:city], :pincode => params[:pincode])
		
		if @customer.save
	      redirect_to action: :index
	    else
	      render :new
	    end 
		@customers = Customer.all
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		if @customer.update_attributes(:name => params[:customer][:name], :email => params[:customer][:email], :city => params[:customer][:city], :pincode => params[:customer][:pincode])
			redirect_to action: :show
		else
			render :edit
		end
	end

	def destroy
		@customer = Customer.find(params[:id])
  		@customer.destroy
  		redirect_to action: :index
	end

	def order
		@customers = Customer.all
	end

end
