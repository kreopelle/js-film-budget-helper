class ProductionsController < ApplicationController
  before_action :require_login
  before_action :set_production, only: [:show, :edit, :update]

  def index
    @productions = Production.all
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
    if @production.update(production_params)
      redirect_to production_path(@production.id)
    else
      render :edit
    end 
  end

  private

  def set_production
    @production = Production.find(params[:id])
  end

  def production_params
    params.require(:production).permit(:name, :budget)
  end

end
