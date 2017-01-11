class CommentsController < ApplicationController
  def create
    # Obtenemos el producto al que le queremos agregar el comentario
    product = Product.find(params[:product_id])
    product.comments.create(comments_params)

    redirect_to product
  end

  private
  def comments_params
    # Permitimos el comentario y lo asociamos al usuario
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
