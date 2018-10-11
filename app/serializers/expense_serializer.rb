class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :vendor, :date, :total, :description
  belongs_to :production
end

# department, status, receipt
