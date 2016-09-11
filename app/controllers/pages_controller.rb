class PagesController < ApplicationController
  def home
  end

  def sms
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @from_number = ENV['FROM_NUMBER']
    @message = params[:message]
    @to_number = params[:user][:number]

    @client = Twilio::REST::Client.new @account_sid, @auth_token
    message = @client.account.messages.create(:body => @message,
                                              :to => @to_number,   # Replace with your phone number
                                              :from => @from_number)  # Replace with your Twilio number

    puts message.sid
  end
end
