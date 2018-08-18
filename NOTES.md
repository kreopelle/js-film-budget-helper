user submits expense
admin approves expense
user reimbursed for expense (if using personal $$)
expense added to general ledger

User Model
- Name: string
- email: string
- role: string
- has_many expenses
- has_many productions, through: expenses

Expense Model
- amount: integer
- vendor: string
- date: date
- receipt image: file
- location (select from on-location: NYC, on-location: Not NYC, studio: NYC, studio: Not NYC ): string? object?
- department: object? string?
- user_id
- production_id
- belongs_to user
- belongs_to production

Production Model
- Name: string
- Budget: integer
- Departments: object? string? --> have NYS depts seeded in?
- has_many users, through expenses?
- has_many expenses


* only admins have access to create_production, edit_production and assign_user_to_production

1. Build models
2. Build controllers
3. Build routes
4. Build views
5. Refactor with helpers
