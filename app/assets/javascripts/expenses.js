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
  const userId = $("h1").data("id")
  console.log(userId)
  //$("#user-expenses").html("<p>Hello</p>")
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
