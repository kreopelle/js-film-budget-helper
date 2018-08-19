module ExpensesHelper

  def current_user_expenses
    Expense.all.collect{ |expense| expense.user_id == current_user.id }
  end

end
