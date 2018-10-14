class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :vendor, :date, :total, :description
  belongs_to :production
  belongs_to :user
  belongs_to :department

end

# status, receipt
