require "order"

RSpec.describe Order do
  it "#The user would like to add dishes to their order and see a list of what they've ordered so far" do
    fake_dish_1 = double :Dish, name: "Pasta", price: 10
    fake_dish_3 = double :Dish, name: "Paella", price: 14
    fake_menu = double :Menu, add_dish: nil, get_dish: fake_dish_1
    allow(fake_menu).to receive(:get_dish).with("Pasta").and_return(fake_dish_1)
    allow(fake_menu).to receive(:get_dish).with("Paella").and_return(fake_dish_3)
    order = Order.new(fake_menu)
    order.add_dish_to_order("Pasta")
    order.add_dish_to_order("Paella")
    expect(order.list_current_order).to eq "Your order so far:\nPasta £10\nPaella £14\n"
  end
  it "After adding dishes to order, the user would like to remove one dish from their order, and see a list of their updated order" do
    fake_dish_1 = double :Dish, name: "Pasta", price: 10
    fake_dish_3 = double :Dish, name: "Paella", price: 14
    fake_menu = double :Menu, add_dish: nil
    allow(fake_menu).to receive(:get_dish).with("Pasta").and_return(fake_dish_1)
    allow(fake_menu).to receive(:get_dish).with("Paella").and_return(fake_dish_3)
    order = Order.new(fake_menu)
    order.add_dish_to_order("Pasta")
    order.add_dish_to_order("Paella")
    order.remove_dish_from_order("Paella")
    expect(order.list_current_order).to eq "Your order so far:\nPasta £10\n"
  end
  it "The user wants to see their order so far, but no dishes have been added yet to their order" do
    fake_dish_1 = double :Dish, name: "Pasta", price: 10
    fake_dish_2 = double :Dish, name: "Curry", price: 11
    fake_dish_3 = double :Dish, name: "Paella", price: 14
    fake_menu = double :Menu, add_dish: nil, get_dish: nil
    order = Order.new(fake_menu)
    expect(order.list_current_order).to eq "Your order is currently empty"
  end
  it "The user orders a dish that is not on the menu" do
    fake_dish_1 = double :Dish, name: "Pasta", price: 10
    fake_dish_2 = double :Dish, name: "Curry", price: 11
    fake_dish_3 = double :Dish, name: "Paella", price: 14
    fake_menu = double :Menu, add_dish: nil, get_dish: nil
    order = Order.new(fake_menu)
    expect(order.add_dish_to_order("Soup")).to eq "Sorry, we don't have that dish on our menu"
  end
  it "The user removes a dish that is not on their order already" do
    fake_dish_1 = double :Dish, name: "Pasta", price: 10
    fake_dish_2 = double :Dish, name: "Curry", price: 11
    fake_dish_3 = double :Dish, name: "Paella", price: 14
    fake_menu = double :Menu, add_dish: nil, get_dish: nil
    order = Order.new(fake_menu)
    order.add_dish_to_order("Pasta")
    expect(order.remove_dish_from_order("Curry")).to eq "Sorry, this dish cannot be removed as it has not been added to your order yet"
  end
end
