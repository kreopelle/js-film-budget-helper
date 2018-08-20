class ExpensesController < ApplicationController
  before_action :require_login
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_id]
      @expenses = User.find(params[:user_id]).expenses
    elsif params[:production_id]
      @expenses = Production.find(params[:production_id]).expenses
    else
      @expenses = Expense.all
    end
  end

  def show
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to user_expense_path(user_id: current_user.id, id: @expense.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @expense.update(expense_params)
    redirect_to user_expense_path(user_id: current_user.id, id: @expense.id)
  end

  def destroy
    @expense.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:vendor, :date, :location, :department, :user_id, :production_id, :total)
  end

end
