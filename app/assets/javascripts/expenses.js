$(function() {
  attachListeners()
})

const attachListeners = () => {

  $('.all-expenses').on('click', (e) => {
    e.preventDefault()
    let userId = $(e.target).attr("data-id")
    history.pushState(null, null, `/users/${userId}/expenses`)
    getExpenses(userId)
  })

  $(document).on('click', '.show-expense', (e) => {
    e.preventDefault()
    let expenseId = $(this).attr('data-id')
    console.log(this)
  })

}

const getExpenses = (userId) => {
  fetch(`/users/${userId}/expenses.json`)
  .then(res => res.json())
  .then(expenses => {
    $('#app-container').html('<h2>My Expenses</h2><br />')
    let expenseColumns = ''
    expenses.forEach(expense => {
      let newExpense = new Expense(expense)
      expenseColumns += newExpense.expenseColumn()
    })
    let expenseHeadings = ["Vendor", "Date", "Total", "Details"]
    $('#app-container').append(fillTable(expenseHeadings, expenseColumns))
  })
}

const fillTable = (headings, columns) => {
  return makeTable(headings) + columns + "</table>"
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
  headers.forEach((header) => { table += `<td><strong>${header}</strong></td>`})
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

Expense.prototype.expenseColumn = function(){
  let expenseColumn = `
  <tr>
  <td>${this.vendor}</td>
  <td>${formatDate(this.date)}</td>
  <td>$${this.total}</td>
  <td><a href="#" data-id="${this.id}" class="show-expense">See More</a></td>
  </tr>`
  return expenseColumn
}
