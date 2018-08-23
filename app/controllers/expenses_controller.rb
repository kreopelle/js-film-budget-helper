class ExpensesController < ApplicationController
  before_action :require_login
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:pending, :approved, :rejected]

  def show
    authorize @expense
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = current_user.expenses.build(expense_params)
      if @expense.save
      @expense.receipt.attach(expense_params[:receipt])
      redirect_to user_expense_path(user_id: current_user.id, id: @expense.id)
    else
      render :new
    end
  end

  def edit
    authorize @expense
  end

  def update
    authorize @expense
    @expense.update(expense_params)
    @expense.receipt.attach(expense_params[:receipt]) if expense_params[:receipt]
    if current_user.admin
      redirect_to production_expense_path(production_id: @expense.production_id, id: @expense.id)
    else
      redirect_to user_expense_path(user_id: current_user.id, id: @expense.id)
    end
  end

  def destroy
    authorize @expense
    @expense.destroy
    redirect_to user_path(current_user.id), notice: "Expense deleted"
  end

  def pending
    @expenses = Expense.pending
  end


  def approved
    @expenses = Expense.approved
  end


  def rejected
    @expenses = Expense.rejected
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:vendor, :date, :location, :department_id, :user_id, :production_id, :total, :receipt, :description)
  end

end
