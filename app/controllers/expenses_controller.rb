class ExpensesController < ApplicationController
  before_action :require_login
  before_action :set_expense, only: [:show, :edit, :update, :destroy, :next]
  before_action :require_admin, only: [:pending, :approved, :rejected]

  def index
    @expenses = current_user.expenses
    respond_to do |f|
      f.html
      f.json {render json: @expenses}
    end
  end

  def show
    respond_to do |f|
      f.html
      f.json {render json: @expense}
    end
  end

  def next
    @next_expense = @expense.next
    render json: @next_expense
  end

  def new
    @expense = Expense.new
    if params[:production_id]
      @production = Production.find(params[:production_id])
    end
  end

  def create
    @expense = current_user.expenses.build(expense_params)
    @expense.save
    render json: @expense
  end

  def edit
  end

  def update
    @expense.update(expense_params)
    @expense.receipt.attach(expense_params[:receipt]) if expense_params[:receipt]
    respond_to do |f|
      f.html
      f.json {render json: @expense}
    end
  end

  def destroy
    @expense.destroy
    redirect_to user_path(current_user.id), notice: "Expense deleted"
  end

  def pending
    @expenses = Expense.pending
  end


  def approved
    @expenses = Expense.approved
  end


  def not_approved
    @expenses = Expense.not_approved
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
    authorize @expense
  end

  def expense_params
    params.require(:expense).permit(:date, :department_id, :description, :production_id, :receipt, :status, :total, :user_id, :vendor)
  end

end
