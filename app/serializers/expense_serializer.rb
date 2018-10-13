class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :vendor, :date, :total, :description
  belongs_to :production, serializer: ExpenseProductionSerializer
  belongs_to :user
end

# department, status, receipt
