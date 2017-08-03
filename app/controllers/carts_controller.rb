class CartsController < ApplicationController

    #GET requests
    def index 	
    end

    def show
        @cart = Cart.find_by(:id => params[:id])
    end

    def new
    	
    end

    def edit
    	
    end

    #POST requests
    def create
    	
    end

    def update
    	
    end

    def destroy
    	
    end

    def checkout
    	cart = Cart.find_by(:id => params[:id])
        flash[:notice] = cart.checkout
        redirect_to cart_path(cart.id)
    end

end
