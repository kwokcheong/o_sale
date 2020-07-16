class ProductsController < ApplicationController

    before_action :find_product, only: [:show, :edit, :update, :destroy]

    def index
        @products = Product.all
    end

    def show
        #why :id? this is a hash, params = {id: 2}
        # @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            # redirect_to @product
            flash.now[:notice] = "Product has been saved"
            redirect_to root_path
        else 
            flash.now[:alert] = "Product has not been saved"
            render :new
        end
    end

    def edit
        # @product = Product.find(params[:id])
    end

    def update
        # @product = Product.find(params[:id])
        if @product.update(product_params)
            flash.now[:notice] = "Product has been updated"
            redirect_to root_path
        else 
            flash.now[:alert] = "Product has not been updated"
            render :edit
        end
    end

    def destroy
        # @product = Product.find(params[:id])
        @product.destroy
        redirect_to root_path
    end

    private 

    def find_product
        begin
            @product = Product.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            redirect_to root_path
        end

    end

    def product_params
        params.require(:product).permit(:name, :price, :description, :image)
    end
end
