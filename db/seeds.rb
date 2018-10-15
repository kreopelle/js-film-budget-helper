departments = [
{nys_acct: "101-00", category: "LOCATIONS"},
{nys_acct: "103-00", category: "WRITING"},
{nys_acct: "105-00", category: "PRODUCER"},
{nys_acct: "107-00", category: "DIRECTOR"},
{nys_acct: "109-00", category: "TALENT"},
{nys_acct: "111-00", category: "TRAVEL & LIVING"},
{nys_acct: "112-00", category: "FRINGE BENEFITS"},
{nys_acct: "113-00", category: "PRODUCTION STAFF"},
{nys_acct: "115-00", category: "EXTRA TALENT"},
{nys_acct: "117-00", category:"CAMERA"},
{nys_acct: "119-00", category:"ART DEPARTMENT"},
{nys_acct: "121-00", category:"CRAFT SERVICES"},
{nys_acct: "123-00", category:"EXPENDABLES"},
{nys_acct: "125-00", category:"WARDROBE"},
{nys_acct: "127-00", category:"ELECTRICAL"},
{nys_acct: "129-00", category:"HAIR & MAKEUP"},
{nys_acct: "131-00", category:"SOUND"}
]
 departments.each do |department_hash|
   Department.find_or_create_by(department_hash)
 end

 Production.create(name: "Parks and Rec", budget: 1000000)
 Production.create(name: "The Manhattan Front", budget: 250000)

 User.create(name: "Ada Lovelace", email: "ada@lovelace.com", password: "ada", admin: true)
 User.create(name: "Ron Swanson", email: "email@pawnee.gov", password: "ron")
 User.create(name: "Leslie Knope", email: "leslie@pawnee.gov", password: "leslie")
 User.create(name: "Kayla Reopelle", email: "kreopelle@gmail.com", password: "kayla")

 Expense.create(vendor: "Charlie Mulligan's Steakhouse", date: DateTime.new(2016,5,2), user_id: 2, production_id: 1, total: 200, department_id: 12, description: "Steak and Lagavulin 16")

 Expense.create(vendor: "Paunch Burger", date: DateTime.new(2016,5,20), user_id: 3, production_id: 1, total: 5, department_id: 12, description: "Child size soda")

 Expense.create(vendor: "JJ's Diner", date: DateTime.new(2016,6,1), user_id: 3, production_id: 1, total: 20, department_id: 12, description: "Waffles")

 Expense.create(vendor: "Hello World", date: DateTime.new(2016,5,31), user_id: 4, production_id: 2, total: 838, department_id: 8, description: "Walkie Talkies")

 Expense.create(vendor: "Home Depot", date: DateTime.new(2016,6,10), user_id: 4, production_id: 2, total: 125, department_id: 11, description: "Lumber")

 Expense.create(vendor: "City of Paris Dry Goods Co.", date: DateTime.new(2018,10,14), user_id: 1, production_id: 2, total: 10, department_id: 14, description: "Corset")
