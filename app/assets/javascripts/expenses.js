const closeTable = "</tr></table>"

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
  makeTable(["Vendor", "Date", "Total"])
  const userId = $("h1").data("id")
  console.log(userId)
  $.get(`/users/${userId}/expenses`, function(data) {
    console.log(data)
  })
}

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
  return table
}
