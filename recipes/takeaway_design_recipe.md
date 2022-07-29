Takeaway design recipe

1. Describe the problem

  As a customer
  So that I can check if I want to order something
  I would like to see a list of dishes with prices.

  As a customer
  So that I can order the meal I want
  I would like to be able to select some number of several available dishes.

  As a customer
  So that I can verify that my order is correct
  I would like to see an itemised receipt with a grand total.

  As a customer
  So that I am reassured that my order will be delivered on time
  I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

2. Design the class system
                                                            Takeaway


┌──────────────────────────────────┐          ┌───────────────────────────────────┐             ┌─────────────────────────────────┐
│           Menu                   │          │            Order                  │             │             Receipt             │
│                                  │          │                                   │             │                                 │
│  -@dishes = []                   │          │   -@current_order = []            │             │   -@order = order               │
│                                  │          │   -@menu = menu                   │             │                                 │
│  -list dishes                    │          │   -add dishes to order            │             │   -provide name and price of    │
│                                  ├──────────┤                                   ├─────────────┤   order and its total sum       │
│                                  │          │   -remove dishes from order       │             │                                 │
│                                  │          │                                   │             │                                 │
│                                  │          │   -show order so far              │             │                                 │
│                                  │          │                                   │             │                                 │
│                                  │          │                                   │             │                                 │
└────────────────┬─────────────────┘          └───────────────────────────────────┘             └─────────────────────────────────┘
                 │
                 │
                 │
                 │
                 │
                 │
 ┌───────────────▼─────────────────┐
 │            Dish                 │
 │                                 │
 │                                 │
 │     -@name                      │
 │     -@price                     │
 │                                 │
 │                                 │
 │                                 │
 │                                 │
 │                                 │
 │                                 │
 └─────────────────────────────────┘



class Dish

  def initialize(dish, price) #dish will be a string, and price will be an integer
    #@dish
    #@price
  end

end

class Menu

  def initialize
    #@dishes # dishes will be an instance variable that holds the dish entries in an array
  end

  def list_dishes
    #returns a list the dishes on the menu
    #string within an array
  end

end


class Order

  def initialize(menu) #menu will be an object of Menu
    #@menu
    #@current_order
  end

  def add_dish_to_order(dish_name) #dish is an object of Dish
    #adds dishes to be ordered
    #returns nothing
  end

  def remove_dish_from_order(dish) #dish is an object of Dish
    #returns a list of dishes that have been ordered
    #string within an array
  end

  def ordered
    #show the order so far
  end
end

class Receipt

  def initialize(order) #order will be an object of Order
    #@order = order
  end

  def bill
    #returns a list of dishes ordered by the user, and their prices, and the total sum of all dishes
  end
end

3. Create examples as Integration Tests

 #The user wants to see the menu

  dish_1 = Dish.new("Pasta", 10)
  dish_2 = Dish.new("Curry", 11)
  dish_3 = Dish.new("Paella", 14)
  menu = Menu.new
  menu.add_dish(dish_1)
  menu.add_dish(dish_2)
  menu.add_dish(dish_2)
  menu.list_dishes # => "Here is the menu:
                        Pasta £10
                        Curry £11
                        Paella 14"


  #The user would like to add dishes to their order and see a list of what they've ordered so far

  dish_1 = Dish.new("Pasta", 10)
  dish_2 = Dish.new("Curry", 11)
  dish_3 = Dish.new("Paella", 14)
  menu = Menu.new
  menu.add_dish(dish_1)
  menu.add_dish(dish_2)
  menu.add_dish(dish_2)
  order = Order.new(menu)
  order.add_dish_to_order(dish_1)
  order.add_dish_to_order(dish_3)
  order.list_current_order # => "Your order so far:
                      Pasta £10
                      Paella £14"

  
  #After adding dishes to order, the user would like to remove one dish from their order, and see a list of their updated order

  dish_1 = Dish.new("Pasta", 10)
  dish_2 = Dish.new("Curry", 11)
  dish_3 = Dish.new("Paella", 14)
  menu = Menu.new
  menu.add_dish(dish_1)
  menu.add_dish(dish_2)
  menu.add_dish(dish_2)
  order = Order.new(menu)
  order.add_dish_to_order(dish_1)
  order.add_dish_to_order(dish_3)
  order.remove_dish_from_order(dish_3)
  order.list_current_order # => "Your order so far:
                      Pasta £10"


  #The user wants to see their order so far, but no dishes have been added yet to their order

  dish_1 = Dish.new("Pasta", 10)
  dish_2 = Dish.new("Curry", 11)
  dish_3 = Dish.new("Paella", 14)
  menu = Menu.new
  menu.add_dish(dish_1)
  menu.add_dish(dish_2)
  menu.add_dish(dish_2)
  order = Order.new(menu)
  order.list_current_order # => "Your order is currently empty"


  #The user has added dishes to be ordered and would like the bill to pay
  
  dish_1 = Dish.new("Pasta", 10)
  dish_2 = Dish.new("Curry", 11)
  dish_3 = Dish.new("Paella", 14)
  menu = Menu.new
  menu.add_dish(dish_1)
  menu.add_dish(dish_2)
  menu.add_dish(dish_2)
  order = Order.new(menu)
  order.add_dish_to_order(dish_1)
  order.add_dish_to_order(dish_3)
  order.remove_dish_from_order(dish_3)
  receipt = Receipt.new(order)
  receipt.bill # => "Here is your receipt:
                    Pasta £10
                    Paella £14

                    Total: £24"


4. Create examples of Unit Tests

  Menu
  #The user wants to see the menu, but no dishes have been added to it
  menu = Menu.new
  menu.list_dishes # => "There are no dishes on the menu"



5. Implement the behaviour


                      