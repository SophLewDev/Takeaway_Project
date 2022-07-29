require "order"
require "dish"
require "menu"
require "payment_process"

RSpec.describe "Integration Tests" do
  it "the user wants to see the list of dishes on the menu" do
    dish_1 = Dish.new("Pasta", 10)
    dish_2 = Dish.new("Curry", 11)
    dish_3 = Dish.new("Paella", 14)
    menu = Menu.new
    menu.add_dish(dish_1)
    menu.add_dish(dish_2)
    menu.add_dish(dish_3)
    expect(menu.list_dishes).to eq  "Here is our menu:\nPasta £10\nCurry £11\nPaella £14\n"
  end
    
  it "The user would like to add dishes to their order and see a list of what they've ordered so far" do
    dish_1 = Dish.new("Pasta", 10)
    dish_2 = Dish.new("Curry", 11)
    dish_3 = Dish.new("Paella", 14)
    menu = Menu.new
    menu.add_dish(dish_1)
    menu.add_dish(dish_2)
    menu.add_dish(dish_3)
    order = Order.new(menu)
    order.add_dish_to_order("Pasta")
    order.add_dish_to_order("Paella")
    expect(order.list_current_order).to eq "Your order so far:\nPasta £10\nPaella £14\n"
  end

   it "After adding dishes to order, the user would like to remove one dish from their order, and see a list of their updated order" do
    dish_1 = Dish.new("Pasta", 10)
    dish_2 = Dish.new("Curry", 11)
    dish_3 = Dish.new("Paella", 14)
    menu = Menu.new
    menu.add_dish(dish_1)
    menu.add_dish(dish_2)
    menu.add_dish(dish_2)
    order = Order.new(menu)
    order.add_dish_to_order("Pasta")
    order.add_dish_to_order("Paella")
    order.remove_dish_from_order("Paella")
    expect(order.list_current_order).to eq "Your order so far:\nPasta £10\n"
   end

   it "The user wants to see their order so far, but no dishes have been added yet to their order" do
    dish_1 = Dish.new("Pasta", 10)
    dish_2 = Dish.new("Curry", 11)
    dish_3 = Dish.new("Paella", 14)
    menu = Menu.new
    menu.add_dish(dish_1)
    menu.add_dish(dish_2)
    menu.add_dish(dish_2)
    order = Order.new(menu)
    expect(order.list_current_order).to eq "Your order is currently empty"
   end

    it "The user has added dishes to be ordered and would like to pay the bill" do
      dish_1 = Dish.new("Pasta", 10)
      dish_2 = Dish.new("Curry", 11)
      dish_3 = Dish.new("Paella", 14)
      menu = Menu.new
      menu.add_dish(dish_1)
      menu.add_dish(dish_2)
      menu.add_dish(dish_3)
      order = Order.new(menu)
      order.add_dish_to_order("Pasta")
      order.add_dish_to_order("Curry")
      order.add_dish_to_order("Paella")
      payment_process = PaymentProcess.new(order)
      expect(payment_process.checkout).to eq  "Here is your receipt:\nPasta £10\nCurry £11\nPaella £14\n\nTotal: £35\n"
    end

    it "The user orders a dish that is not on the menu" do
      dish_1 = Dish.new("Pasta", 10)
      dish_2 = Dish.new("Curry", 11)
      dish_3 = Dish.new("Paella", 14)
      menu = Menu.new
      menu.add_dish(dish_1)
      menu.add_dish(dish_2)
      menu.add_dish(dish_3)
      order = Order.new(menu)
      expect(order.add_dish_to_order("Soup")).to eq "Sorry, we don't have that dish on our menu"
    end
    it "The user removes a dish that is not on their order already" do
      dish_1 = Dish.new("Pasta", 10)
      dish_2 = Dish.new("Curry", 11)
      dish_3 = Dish.new("Paella", 14)
      menu = Menu.new
      menu.add_dish(dish_1)
      menu.add_dish(dish_2)
      menu.add_dish(dish_3)
      order = Order.new(menu)
      order.add_dish_to_order("Pasta")
      expect(order.remove_dish_from_order("Curry")).to eq "Sorry, this dish cannot be removed as it has not been added to your order yet"
    end
    it "The user wants the bill but nothing has been added to the order" do
      dish_1 = Dish.new("Pasta", 10)
      dish_2 = Dish.new("Curry", 11)
      dish_3 = Dish.new("Paella", 14)
      menu = Menu.new
      menu.add_dish(dish_1)
      menu.add_dish(dish_2)
      menu.add_dish(dish_3)
      order = Order.new(menu)
      payment_process = PaymentProcess.new(order)
      expect(payment_process.checkout).to eq "Here is your receipt:\n\nTotal: £0\n"
    end
    it "The user has paid for their bill" do
      dish_1 = Dish.new("Pasta", 10)
      dish_2 = Dish.new("Curry", 11)
      dish_3 = Dish.new("Paella", 14)
      menu = Menu.new
      menu.add_dish(dish_1)
      menu.add_dish(dish_2)
      menu.add_dish(dish_3)
      order = Order.new(menu)
      payment_process = PaymentProcess.new(order)
      expect(payment_process.buy).to eq "You will receive a confirmation text shortly\n"
    end
end