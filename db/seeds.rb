# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
how_many = 50

expense_places = ["Stag's Head", "Only Burger", "Progress Energy", "Trader Joe's"]

how_many.times do
  random = (1..100).to_a.sample
  if random < 26
    Transaction.create!(recipient: expense_places.sample,
        transaction_type: "Withdrawal",
        amount: Faker::Commerce.price,
        created_at: Faker::Date.between(1.month.ago, Date.today))
  elsif random < 51
    Transaction.create!(recipient: expense_places.sample,
        transaction_type: "Withdrawal",
        amount: Faker::Commerce.price,
        created_at: Faker::Date.between(2.months.ago, Date.today))
  elsif random < 76
    Transaction.create!(recipient: "Bank",
        transaction_type: "Deposit",
        amount: Faker::Commerce.price,
        created_at: Faker::Date.between(2.months.ago, Date.today))
  else
    Transaction.create!(recipient: "Bank",
        transaction_type: "Deposit",
        amount: Faker::Commerce.price,
        created_at: Faker::Date.between(1.month.ago, Date.today))
  end
end
