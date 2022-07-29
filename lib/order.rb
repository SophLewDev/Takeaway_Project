class Order

  def initialize(menu) #menu will be an object of Menu
    @menu = menu
    @current_order = []
  end

  def current_order
    @current_order
  end

  def add_dish_to_order(dish_name)
    if @menu.get_dish(dish_name)
      @current_order << @menu.get_dish(dish_name)
    else
      "Sorry, we don't have that dish on our menu"
    end
  end

  def remove_dish_from_order(dish_name)
    if @current_order.find { |dish| dish.name == dish_name}
      @current_order.delete(@menu.get_dish(dish_name))
    else
      "Sorry, this dish cannot be removed as it has not been added to your order yet"
    end
  end

  def list_current_order
    if @current_order == []
      return "Your order is currently empty"
    else
      order_string = "Your order so far:\n"
      @current_order.each { |dish|
        order_string.concat("#{dish.name} £#{dish.price}\n")
      }
    end
    order_string
  end

  def current_total_cost
    @current_order.sum { |dish| dish.price }
  end
end