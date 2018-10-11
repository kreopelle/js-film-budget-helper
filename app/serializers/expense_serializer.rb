class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :vendor, :date, :total, :description
  belongs_to :production, serializer: ExpenseProductionSerializer
end

# department, status, receipt
