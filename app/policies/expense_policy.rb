class ExpensePolicy < ApplicationPolicy
  attr_reader :expense

  def initialize(user, expense)
    super(user, expense)
    @expense = record
  end

  def show?
    update?
  end

  def update?
    user.admin? || user.owns_expense(@expense)
  end

  def destroy?
    update?
  end

end
