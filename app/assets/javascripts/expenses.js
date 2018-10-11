$(function() {
  attachListeners()
})

const attachListeners = () => {
  $(".show-expense").on('click', function() {
    showExpense(this)
  })
}

const showExpense = (expense) => {
  alert("clicked")
  console.log(expense.innerText)
}
