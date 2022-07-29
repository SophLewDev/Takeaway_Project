class Menu

  def initialize
    @dishes = []
  end

  def list_dishes
    if @dishes == []
      return "There are no dishes on the menu"
    else
      menu_string = "Here is our menu:\n"
      @dishes.each { |dish|
        menu_string.concat("#{dish.name} £#{dish.price}\n")
      }
    end
    menu_string
  end

  def add_dish(dish)
      @dishes << dish
  end

  def get_dish(dish_name)
    @dishes.find {|dish| dish.name == dish_name}
  end
    
end





# @dishes.find {|dish| dish.name == dish_name}

# def get_dish(dish_name)
#   #finds and returns the dish you want and it's price
# end