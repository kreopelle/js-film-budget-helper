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

const makeTable = (headers) => {
  const table = "<table class="table"><tr>"
  headers.forEach((header) => {
    table += `<td><strong>${header}</strong></td>`
  })
  table += "</tr></table>"
}


    <% expenses.find_each do |expense| %>
      <tr>
        <td><%= expense.vendor %></td>
        <td><%= expense.formatted_date %></td>
        <td><%= expense.department_category %></td>
        <td><%= expense.dollar_total %></td>
        <td><%= expense.status %></td>
        <td><a href="#" data-id="<%= expense.id %>" class="show-expense">See More</a></td>
      </tr>
      <div id="display-expense-<%= expense.id %>"></div>
    <% end %>
  </table>
