$(function() {
  attachListeners()
})

const attachListeners = () => {

  $('.all-expenses').on('click', (e) => {
    e.preventDefault()
    let userId = $(this).attr('data-id')
    fetch(`/users/${userId}/expenses.json`)
    .then(res => res.json())
    .then(expenses => {
      $('#app-container').html('')
      getExpenses(expenses)
    })
  })

}

const getExpenses = (expenses) => {
  let expenseHtml = ''
   expenses.forEach(expense => {
    let newExpense = new Expense(expense)
    expenseHtml += expenseColumn(newExpense)
  })
  let expenseTable = makeTable(["Vendor", "Date", "Total", "Details"]) + expenseHtml + "</table>"
  $('#app-container').html(expenseTable)
}

const showExpense = (expenseId) => {
  const userId = $("h1").data("id")
  $.get(`/users/${userId}/expenses/${expenseId}`, function(data) {
    const expense = data
    let details = "<ul>"
    details += `<li>Description: ${expense.description || "None"}</li><li>Production: ${expense.production.name}</li>`
    $("#show-expense").html(details)
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

function Expense(expense) {
  this.id = expense.id
  this.vendor = expense.vendor
  this.date = expense.date
  this.total = expense.total
  this.production = expense.production.name
}

const expenseColumn = (expense) => {
  let expenseColumn = `
  <tr>
  <td>${expense.vendor}</td>
  <td>${formatDate(expense.date)}</td>
  <td>$${expense.total}</td>
  <td><a href="#" data-id="${expense.id}" class="show-expense" onclick="showExpense(${expense.id})">See More</a></td>
  </tr>`
  return expenseColumn
}
