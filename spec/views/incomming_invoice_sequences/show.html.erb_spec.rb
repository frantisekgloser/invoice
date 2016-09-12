require 'rails_helper'

RSpec.describe "incomming_invoice_sequences/show.html.erb", type: :view do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    
    if User.where(:email ==  "test@test.com") == []
      @user = User.create!(email: 'test@test.com', password: '12test34', trade_subject: 'test', identification_number: '123', house_number: 1, city: 'test_city', postal_code: '123', country: 'test_country')
    else
      @user = User.where(:email ==  "test@test.com")
    end

    sign_in @user
    @incomming_invoice_sequence = IncommingInvoiceSequence.create!(name: 'test_incomming_invoice_sequence_name', note: 'test_incomming_invoice_sequence_note', user_id: @user.id)
  end

  it "shows Incomming invoice sequence with id: as parameter" do

    controller.extra_params = { :id => @incomming_invoice_sequence.id }
    expect(controller.request.fullpath).to eq incomming_invoice_sequence_path(@incomming_invoice_sequence)
  end  
end
