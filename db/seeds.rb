# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.destroy_all
Author.destroy_all
Bookstore.destroy_all
Employee.destroy_all

king = Author.create!(name: 'Stephen King', best_selling_author: true, year_first_published: 1974)
newport = Author.create!(name: 'Cal Newport', best_selling_author: true, year_first_published: 2005)
bandn = Bookstore.create!(name: 'Barnes & Noble', has_coffee_shop: true, days_open_per_week: 7)
bns = Bookstore.create!(name: 'Books N Stuff', has_coffee_shop: false, days_open_per_week: 6)

newport.books.create!(name: 'Deep Work', fiction: false, number_of_pages: 304)
newport.books.create!(name: 'Digital Minimalism', fiction: false, number_of_pages: 302)
king.books.create!(name: 'The Shining', fiction: true, number_of_pages: 447)
king.books.create!(name: 'It', fiction: true, number_of_pages: 1000)

bandn.employees.create!(name: 'John Doe', employee_of_the_month: false, age: 16)
bandn.employees.create!(name: 'Bobert Gu', employee_of_the_month: true, age: 27)
bns.employees.create!(name: 'Jane Doe', employee_of_the_month: true, age: 19)
bns.employees.create!(name: 'Paige Turner', employee_of_the_month: false, age: 32)
