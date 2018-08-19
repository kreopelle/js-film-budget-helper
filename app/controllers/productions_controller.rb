class ProductionsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @production = Production.new
  end

  def create
    raise params.inspect
  end

  def edit
  end

  def update
  end


end
