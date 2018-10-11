$(function() {
  attachListeners()
})

const attachListeners = () => {
  $(".show-expense").on('click', function() {
    showExpense(this)
  })
}

const showExpense = (expense) => {
  let expenseId = $(expense).data("id")
  $.get(`/expenses/${expenseId}`, function(data) {
    console.log(data)
  })
}
