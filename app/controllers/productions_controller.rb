class ProductionsController < ApplicationController

  before_action :set_production, only: [:show, :edit, :update]

  def index
  end

  def show
  end

  def new
    @production = Production.new
  end

  def create
    @production = Production.new(production_params)
    if @production.save
      redirect_to production_path(@production.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def set_production
    @production = Production.find(params[:id])
  end

  def production_params
    params.require(:production).permit(:name, :budget)
  end

end
