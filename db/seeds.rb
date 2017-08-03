User.destroy_all
Cart.destroy_all
Item.destroy_all
LineItem.destroy_all


10.times do 
  Item.create(
    title: Faker::Commerce.product_name, 
    inventory: Faker::Number.number(2), 
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

#users
fake_password1 = Faker::Number.number(10)
User.create(
	email: "mo1@mo.com",
	password: fake_password1,
	password_confirmation: fake_password1
)

fake_password2 = Faker::Number.number(10)
User.create(
	email: "mo2@mo.com",
	password: fake_password2,
	password_confirmation: fake_password2
)

fake_password3 = Faker::Number.number(10)
User.create(
	email: "mo3@mo.com",
	password: fake_password3,
	password_confirmation: fake_password3
)









