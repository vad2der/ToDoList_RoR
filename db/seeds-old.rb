# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
User.create! [
  {username: "Fiorina", password_digest: "Carly1954"},
  {username: "Trump", password_digest:  "Donald1946"},
  {username: "Carson", password_digest: "Ben1951"},
  {username: "Clinton", password_digest: "Hillary1947"}
]

cf = User.find_by(username: "Fiorina")
dt = User.find_by(username: "Trump")
bc = User.find_by(username: "Carson")
hc = User.find_by(username: "Clinton")

Profile.destroy_all
cf.create_profile(first_name: "Carly", last_name: "Fiorina", gender: "female", birth_year: 1954)
dt.create_profile(first_name: "Donald", last_name: "Trump", gender: "male", birth_year: 1946)
bc.create_profile(first_name: "Ben", last_name: "Carson", gender: "male", birth_year: 1951)
hc.create_profile(first_name: "Hillary", last_name: "Clinton", gender: "female", birth_year: 1947)

TodoList.destroy_all
TodoList.create! [
  {list_name: "Carly List", list_due_date: Date.today+1.year},
  {list_name: "Donald List", list_due_date: Date.today+1.year},
  {list_name: "Ben List", list_due_date: Date.today+1.year},
  {list_name: "Hillary List", list_due_date: Date.today+1.year}
]
cf.todo_lists << TodoList.where('list_name LIKE ?', "#{'Carly'}%")
dt.todo_lists << TodoList.where('list_name LIKE ?', "#{'Donald'}%")
bc.todo_lists << TodoList.where('list_name LIKE ?', "#{'Ben'}%")
hc.todo_lists << TodoList.where('list_name LIKE ?', "#{'Hillary'}%")

TodoItem.destroy_all
a5 = [1, 2, 3, 4, 5]
a5.each do |a|
	astr = a.to_s
	TodoItem.create!(due_date: Date.today+1.year, title: "Carly Item "+astr, description: "Description for Carly Item "+astr, completed: false)
	TodoItem.create!(due_date: Date.today+1.year, title: "Donald Item "+astr, description: "Description for Carly Item "+astr, completed: false)
	TodoItem.create!(due_date: Date.today+1.year, title: "Ben Item "+astr, description: "Description for Carly Item "+astr, completed: false)
	TodoItem.create!(due_date: Date.today+1.year, title: "Hillary Item "+astr, description: "Description for Carly Item "+astr, completed: false)
end

cf.todo_lists.first.todo_items << TodoItem.where('title LIKE ?', "#{'Carly'}%")
dt.todo_lists.first.todo_items << TodoItem.where('title LIKE ?', "#{'Donald'}%")
bc.todo_lists.first.todo_items << TodoItem.where('title LIKE ?', "#{'Ben'}%")
hc.todo_lists.first.todo_items << TodoItem.where('title LIKE ?', "#{'Hillary'}%")