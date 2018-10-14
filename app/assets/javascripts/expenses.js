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
    let expenseHeadings = ["Vendor", "Date", "Total", "Details"]
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
  this.userId = expense.user.id
  this.description = expense.description
  this.userName = expense.user.name
}

Expense.prototype.formatShow = function(){
  let expenseHtml = `
  <h3>Vendor: ${this.vendor}</h3><br>
  <p><strong>Date: </strong>${formatDate(this.date)}</p>
  <p><strong>Total: </strong>$${this.total}</p>
  <p><strong>Production: </strong>${ this.production }</p>
  <p><strong>Submitted by: </strong>${ this.username }</p>
  <p><strong>Description: </strong>${this.description || "None"}</p><br>
  <button class="next-expense" data-user="${this.userId}" data-id="${this.id}">Next</button>
  `
  return expenseHtml
}

  // <p><strong>Department: </strong>${ this.department_category }</p>
  // ${ image_tag(this.receipt, class:"img-fluid") }<br></br>
  // ${ display_expense_status(current_user, this) }<br>
  // <p>${ link_to "Edit Expense", edit_user_expense_path(current_user, this) } | ${ link_to "Delete Expense", expense_path(this), method: :delete } | ${ link_to "Back to My Expenses", user_path(current_user) }</p>


Expense.prototype.expenseColumn = function(){
  let expenseColumn = `
  <tr>
  <td>${this.vendor}</td>
  <td>${formatDate(this.date)}</td>
  <td>$${this.total}</td>
  <td><a href="#" data-user="${this.userId}" data-id="${this.id}" class="show-expense">See More</a></td>
  </tr>`
  return expenseColumn
}
