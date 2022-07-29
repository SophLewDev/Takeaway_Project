require "payment_process"

RSpec.describe PaymentProcess do
  it "The user has added dishes to be ordered and would like to pay the bill" do
    fake_dish_1 = double :Dish, name: "Pasta", price: 10
    fake_dish_2 = double :Dish, name: "Curry", price: 11
    fake_dish_3 = double :Dish, name: "Paella", price: 14
    fake_menu = double :Menu, add_dish: nil, get_dish: nil
    fake_order = double :Order, add_dish_to_order: nil, remove_dish_from_order: nil, current_total_cost: "35"
    allow(fake_order).to receive(:current_order).and_return([fake_dish_1, fake_dish_2, fake_dish_3])
    payment_process = PaymentProcess.new(fake_order)
    expect(payment_process.checkout).to eq  "Here is your receipt:\nPasta £10\nCurry £11\nPaella £14\n\nTotal: £35\n"
  end

  it "The user wants the bill but nothing has been added to the order" do
    fake_order = double :Order, add_dish_to_order: nil, current_order: nil, remove_dish_from_order: nil, current_total_cost: "0"
    payment_process = PaymentProcess.new(fake_order)
    expect(payment_process.checkout).to eq "Here is your receipt:\n\nTotal: £0\n"
  end
  it "The user has paid for their bill" do
    fake_order = double(:Order)
    fake_send_sms = double(:FakeSendSMS, confirmation_text: nil)
    stub_const("SendSMS", class_double("FakeSendSMS", new: fake_send_sms))
    
    payment_process = PaymentProcess.new(fake_order)
    expect(payment_process.buy).to eq "You will receive a confirmation text shortly\n"
  end
end
 