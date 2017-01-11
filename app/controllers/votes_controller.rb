class VotesController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    # No se obtienen campos para el voto simplemente se relaciona a un usuario
    product.votes.create(user: current_user)

    redirect_to root_path
  end

  def destroy
    product = Product.find(params[:product_id])
    # .take toma el primer elemento y .try verifica que no sea nil
    product.votes.where(user: current_user).take.try(:destroy)

    redirect_to root_path
  end
end
