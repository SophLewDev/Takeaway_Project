require "send_sms"

class PaymentProcess

  def initialize(order) #order will be an object of Order
    @order = order
  end

  def checkout
    create_receipt_string
  end

  def buy
    SendSMS.new.confirmation_text
    "You will receive a confirmation text shortly\n"
  end

  private

  def create_receipt_string
    if @order.current_order.nil?
      return "Here is your receipt:\n\nTotal: £0\n"
    else
      receipt_string = "Here is your receipt:\n"
      @order.current_order.each { |dish|
        receipt_string.concat("#{dish.name} £#{dish.price}\n")
      }
      receipt_string + "\nTotal: £#{@order.current_total_cost}\n"
    end
  end

end
