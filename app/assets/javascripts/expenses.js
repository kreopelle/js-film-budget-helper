$(function() {
  attachListeners()
})

const attachListeners = () => {

  displayExpenses()

}

const displayExpenses = () => {
  const userId = $("h1").data("id")
  $.get(`/users/${userId}/expenses`, function(data) {
    const expensesTable = makeTable(["Vendor", "Date", "Total", "Details"]) + expenseColumns(data) + "</table>"
    $("#user-expenses").append(expensesTable)
  })
}

const showExpense = (expenseId) => {
  const userId = $("h1").data("id")
  $.get(`/users/${userId}/expenses/${expenseId}`, function(data) {
    console.log(data)
  })
}

const makeTable = (headers) => {
  let table = "<table class='table'><tr>"
  headers.forEach((header) => {
    table += `<td><strong>${header}</strong></td>`
  })
  table += "</tr>"
  return table
}

const formatDate = (date) => {
  date = date.split('T')[0]
  date = date.split("-")
  date = date[1] + "/" + date[2] + "/" + date[0]
  return date
}

const expenseColumns = (expenses) => {
  expenseColumnString = ""
  expenses.forEach(expense => {
  expenseColumnString += `<tr><td>${expense.vendor}</td><td>${formatDate(expense.date)}</td><td>$${expense.total}</td><td><a href="#" data-id="${expense.id}" class="show-expense" onclick="showExpense(${expense.id})">See More</a></td></tr>`
  })
  return expenseColumnString
}
