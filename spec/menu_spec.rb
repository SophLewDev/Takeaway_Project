require "menu"

RSpec.describe Menu do
  it "the user wants to see the list of dishes on the menu" do
    fake_dish_1 = double :Dish, name: "Pasta", price: 10
    fake_dish_2 = double :Dish, name: "Curry", price: 11
    fake_dish_3 = double :Dish, name: "Paella", price: 14
    menu = Menu.new
    menu.add_dish(fake_dish_1)
    menu.add_dish(fake_dish_2)
    menu.add_dish(fake_dish_3)
    expect(menu.list_dishes).to eq  "Here is our menu:\nPasta £10\nCurry £11\nPaella £14\n"
  end
  it "get dish returns the given dish" do
    fake_dish_1 = double :Dish, name: "Pasta", price: 10
    menu = Menu.new
    menu.add_dish(fake_dish_1)
    expect(menu.get_dish("Pasta")).to eq fake_dish_1
  end
   it "The user wants to see the menu, but no dishes have been added to it" do
    menu = Menu.new
    expect(menu.list_dishes).to eq "There are no dishes on the menu"
   end
end