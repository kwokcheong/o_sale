class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def show
        #why :id? this is a hash, params = {id: 2}
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            # redirect_to @product
            redirect_to root_path
        else 
            render 'new'
        end
    end

    private 
    def product_params
        params.require(:product).permit(:name, :price, :description, :image)
    end
end
