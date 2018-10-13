class ExpensePolicy < ApplicationPolicy
  attr_reader :expense

  def initialize(user, expense)
    super(user, expense)
    @expense = record
  end

  def show?
    user.admin? || user.owns_expense(@expense)
  end

  def update?
    show? && @expense.status != "approved"
  end

  def destroy?
    update?
  end

  def next?
    user.owns_expense(@expense)
  end

end
