class ExpensesController < ApplicationController
  before_action :require_login

  def index
    @expenses = Expense.all
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to expense_path(@expense)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def expense_params
    params.require(:expense).permit(:vendor, :date, :location, :department, :user_id, :production_id, :total)
  end

end
