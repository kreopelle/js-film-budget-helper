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
 departments.each do |department|
   Department.find_or_create_by(department)
 end

productions = [
  {name: "Parks and Rec", budget: 1000000},
  {name: "The Manhattan Front", budget: 250000}
]

productions.each do |production|
  Production.find_or_create_by(production)
end

  users = [
    {name: "Ada Lovelace", email: "ada@lovelace.com", password_digest: BCrypt::Password.create("ada"), admin: true},
    {name: "Ron Swanson", email: "email@pawnee.gov", password_digest: BCrypt::Password.create("ron")},
    {name: "Leslie Knope", email: "leslie@pawnee.gov", password_digest: BCrypt::Password.create("leslie")},
    {name: "Kayla Reopelle", email: "kreopelle@gmail.com", password_digest: BCrypt::Password.create("kayla")}
  ]

users.each do |user|
  User.find_or_create_by(user)
end

user1 = User.find(1)
user1.expenses.create(vendor: "Hello World", date: DateTime.new(2016,5,31), production_id: 2, total: 838, department_id: 8, description: "Walkie Talkies")
user1.expenses.create(vendor: "Home Depot", date: DateTime.new(2016,6,10), production_id: 2, total: 125, department_id: 11, description: "Lumber")
user1.expenses.create(vendor: "City of Paris Dry Goods Co.", date: DateTime.new(2018,10,14), production_id: 2, total: 10, department_id: 14, description: "Corset")

user2 = User.find(2)
user2.expenses.create(vendor: "Charlie Mulligan's Steakhouse", date: DateTime.new(2016,5,2), production_id: 1, total: 200, department_id: 12, description: "Steak and Lagavulin 16")
user2.expenses.create(vendor: "Paunch Burger", date: DateTime.new(2016,5,20), production_id: 1, total: 5, department_id: 12, description: "Child size soda")
user2.expenses.create(vendor: "JJ's Diner", date: DateTime.new(2016,6,1), production_id: 1, total: 20, department_id: 12, description: "Waffles")
