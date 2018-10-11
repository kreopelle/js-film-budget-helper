$(function() {
  attachListeners()
})

const attachListeners = () => {
  $(".show-expense").on('click', function() {
    alert("Clicked")
  })
}
