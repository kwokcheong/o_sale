class CommentsController < ApplicationController
    before_action :require_signin
    before_action :set_product

    #build is the same as new except that the id of product is added to the build/new
    def create
        @comment = @product.comments.build(comment_params)
        @comment.user = current_user

        if @comment.save
            flash[:notice] = "Comment has been created"
            redirect_to product_path(@product.id)
        else
            @comments = @product.comments
            flash.now[:alert] = "Comment has not been created"
            render 'products/show'
        end
    end

    private
    def set_product
        @product = Product.where(id: params[:product_id]).first
    end

    def comment_params
        params.require(:comment).permit(:body)
    end
end