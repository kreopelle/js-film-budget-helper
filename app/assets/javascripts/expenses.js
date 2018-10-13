$(function() {
  attachListeners()
})

const attachListeners = () => {
  $(".show-expense").on('click', function() {
    showExpense(this)
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
