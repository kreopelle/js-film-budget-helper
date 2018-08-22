module ExpensesHelper
  def expense_link
    if params[:production_id]
      production_expense_path(Production.find(params[:production_id]), expense.id)
    elsif params[:user_id]
      user_expense_path(current_user.id, expense.id)
    else
      expense_path(expense.id)
    end
  end 
end
