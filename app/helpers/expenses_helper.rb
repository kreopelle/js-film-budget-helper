module ExpensesHelper

  def user_expenses_table(user)
    if user.expenses.size == 0
      content_tag(:p, "You don't have any expenses yet!")
      link_to "Add one here!", new_user_expense_path
    else
      render partial: "expenses/table", locals: {expenses: user.expenses}
    end
  end

  def status_expenses_table(expenses)
    if expenses.size == 0
      content_tag(:p, "No expenses in this category.")
    else
      render partial: "expenses/table", locals: {expenses: expenses}
    end
  end

  def display_expense_status(user, expense)
    if user.admin && expense.status == "pending"
      render partial: "expenses/approve_expense", locals: {expense: expense}
    else
      content_tag(:p, "".html_safe + "Status: #{expense.status}")
    end
  end

end
