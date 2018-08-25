module ExpensesHelper

  def user_expenses_table(user)
    if user.expenses.size == 0
      content_tag(:p, "You don't have any expenses yet!".html_safe + " " + link_to("Add one here!", new_user_expense_path(user)) )
    else
      render partial: "expenses/table", locals: {expenses: user.expenses}
    end
  end

  def status_expenses_table(expenses)
    if expenses.size == 0
      content_tag(:p, "Currently, there are no expenses in this category.")
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

  def expense_description(expense)
    if expense.description
      content_tag(:p, "".html_save + "Description: #{expense.description}")
    end
  end

end
