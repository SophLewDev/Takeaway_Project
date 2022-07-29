require 'rubygems'
require 'twilio-ruby'
require 'dotenv/load'

class SendSMS
  def initialize
    @requestor = Twilio::REST::Client
  end
  
  def confirmation_text
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = @requestor.new(account_sid, auth_token)

    message = @client.messages
      .create(
        body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 30*60).strftime("at %I:%M%p")}",
        from: '+12569527517',
        to: '+447773692140'
      )

    puts message.sid
  end
end



