$(function() {
  attachListeners()
})

const attachListeners = () => {

  displayExpenses()

  $(".show-expense").on('click', function() {
    showExpense(this)
  })

}

const displayExpenses = () => {
  let table = makeTable(["Vendor", "Date", "Total"])
  const userId = $("h1").data("id")
  let expenseColumns
  $.get(`/users/${userId}/expenses`, function(data) {
    const expenses = data
    expenseColumns = expenses.forEach(expense => {
      debugger
      `<tr><td>${expense.vendor}</td><td>${formatDate(expense.date)}</td><td>${expense.total}</td></tr>`
    })
  })
  const expensesTable = table + expenseColumns + "</table>"
  $("#user-expenses").append(expensesTable)
}
//<div id="display-expense-<%= expense.id %>"></div>
//<td><a href="#" data-id="<%= expense.id %>" class="show-expense">See More</a></td>

// incomplete, would like to set up index before continuing
const showExpense = (expense) => {
  let expenseId = $(expense).data("id")
  let divId = "display-expense-" + expenseId
  $.get(`/expenses/${expenseId}`, function(data) {
    $(divId).window(data)
  })
  alert("click")
}

const makeTable = (headers) => {
  let table = "<table class='table'><tr>"
  headers.forEach((header) => {
    table += `<td><strong>${header}</strong></td>`
  })
  table += "</tr>"
  return table
}

const dateFormatter = (date) => {
  date = date.split('T')[0]
  date = date.split("-")
  date = date[1] + "/" + date[2] + "/" + date[0]
  return date
}
