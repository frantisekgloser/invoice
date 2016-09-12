require 'rails_helper'

RSpec.describe "outgoing_invoice_items/index.html.erb", type: :view do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    
    if User.where(:email ==  "test@test.com") == []
      @user = User.create!(email: 'test@test.com', password: '12test34', trade_subject: 'test', identification_number: '123', house_number: 1, city: 'test_city', postal_code: '123', country: 'test_country')
    else
      @user = User.where(:email ==  "test@test.com")
    end

    sign_in @user
    @currency = Currency.create!(name: 'test_currency', user_id: @user.id)
    @bank = Bank.create!(name: 'test_bank', code: 'test_bank_code', user_id: @user.id)
    @exchange_rate = ExchangeRate.create!(rate: '0.123', date: '2016-09-08', bank_id: @bank.id, currency_id: @currency.id, user_id: @user.id)
    @trade_subject = TradeSubject.create!(name: 'test_trade_subject_name', identification_number: '123', vat: 'test_trade_subject_vat', user_id: @user.id)
    @outgoing_invoice_sequence = OutgoingInvoiceSequence.create!(name: 'test_outgoing_invoice_sequence_name', note: 'test_outgoing_invoice_sequence_note', user_id: @user.id)
    @outgoing_invoice = OutgoingInvoice.create!(number: '123', generated_on_date: '2016-03-04', taxable_supply_date: '2016-04-05', due_date: '2016-05-06', total_computed_base: '123', total_computed_vat: '234', total_corrected_base: '345', total_corrected_vat: '456', reverse_charge: true, paid: true, note: 'test_outgoing_invoice_note', outgoing_invoice_sequence_id: @outgoing_invoice_sequence.id, trade_subject_id: @trade_subject.id, currency_id: @currency.id, exchange_rate_id: @exchange_rate.id, user_id: @user.id)
  end

  it "shows index of Outgoing invoice items" do

    controller.extra_params = { :outgoing_invoice_id => @outgoing_invoice.id }
    expect(controller.request.fullpath).to eq outgoing_invoice_outgoing_invoice_items_path(@outgoing_invoice)
  end  
end
