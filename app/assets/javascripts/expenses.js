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

  $('#new-expense-form').submit(function(e) {
    e.preventDefault()
    $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: "JSON",
      success: function(expense) {
        showExpense(expense.user.id, expense.id)
      }
    })
  })

  $(document).on('click', '.show-expense', (e) => {
    e.preventDefault()
    let userId = $(e.target).attr("data-user")
    let expenseId = $(e.target).attr("data-id")
    showExpense(userId, expenseId)
  })

  $(document).on('click', '.next-expense', (e) => {
    e.preventDefault()
    let userId = $(e.target).attr("data-user")
    let expenseId = $(e.target).attr("data-id")
    fetch(`${expenseId}/next.json`)
    .then(res => res.json())
    .then(expense => {
      showExpense(expense.user.id, expense.id)
    })
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
    let expenseHeadings = ["Vendor", "Date", "Department", "Total", "Details"]
    $('#app-container').append(fillTable(expenseHeadings, expenseColumns))
  })
}

const fillTable = (headings, columns) => {
  return makeTable(headings) + columns + "</table>"
}

const showExpense = (userId, expenseId) => {
  history.pushState(null, null, `/users/${userId}/expenses/${expenseId}`)
  fetch(`/users/${userId}/expenses/${expenseId}.json`)
  .then(res => res.json())
  .then(expense => {
    $('#app-container').html(`<h5>Expense ${expenseId}</h5><br>`)
    let newExpense = new Expense(expense)
    let expenseHtml = newExpense.formatShow()
    $('#app-container').append(expenseHtml)
  })
}

const makeTable = (headers) => {
  let table = "<table class='table'><tr>"
  headers.forEach((header) => { table += `<td><strong>${header}</strong></td>`})
  table += "</tr>"
  return table
}

const total = new Intl.NumberFormat('en-US', {
  style: 'currency',
  currency: 'USD',
  minimumFractionDigits: 2
})

const formatDate = (date) => {
  date = date.split('T')[0]
  date = date.split("-")
  year = date[0]
  year = year.slice(2)
  date = date[1] + "/" + date[2] + "/" + year
  return date
}

function Expense(expense) {
  this.id = expense.id
  this.vendor = expense.vendor
  this.date = expense.date
  this.total = expense.total
  this.production = expense.production.name
  this.userId = expense.user.id
  this.description = expense.description
  this.department = expense.department.category
  this.userName = expense.user.name
}

Expense.prototype.formatShow = function(){
  let expenseHtml = `
  <h3>Vendor: ${this.vendor}</h3><br>
  <p><strong>Date: </strong>${formatDate(this.date)}</p>
  <p><strong>Total: </strong>${total.format(this.total)}</p>
  <p><strong>Production: </strong>${ this.production }</p>
  <p><strong>Department: </strong>${ this.department }</p>
  <p><strong>Submitted by: </strong>${ this.userName }</p>
  <p><strong>Description: </strong>${this.description || "None"}</p><br />
  <p><a href="/users/${this.userId}/expenses/${this.id}/edit">Edit Expense</a> | <a data-confirm="Are you sure you'd like to delete this expense?" data-method="delete" href="/users/${this.userId}/expenses/${this.id}/" rel="nofollow">Delete Expense</a> | <a href="/users/${this.userId}/expenses">Back to My Expenses</a></p><br>
  <button class="next-expense" data-user="${this.userId}" data-id="${this.id}">Next</button>
  `
  return expenseHtml
}

Expense.prototype.expenseColumn = function(){
  let expenseColumn = `
  <tr>
  <td>${this.vendor}</td>
  <td>${formatDate(this.date)}</td>
  <td>${this.department}</td>
  <td>${total.format(this.total)}</td>
  <td><a href="#" data-user="${this.userId}" data-id="${this.id}" class="show-expense">See More</a></td>
  </tr>`
  return expenseColumn
}
