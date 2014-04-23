class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to @sale, notice: 'Successfully created sale'
    else
      render 'new'
    end
  end

  def index
    @sale = Sale.all
  end

  private

  def sale_params
    params.require(:sale).permit(:title, :description, :category_id, :city, :state, :price, :phone_number, :image)
  end
end
