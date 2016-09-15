require 'rails_helper'

RSpec.describe "incomming_invoices/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:incomming_invoice) {FactoryGirl.create(:incomming_invoice)}

  before do
    sign_in user
  end

  it "shows Incomming invoice with id: as parameter" do

    controller.extra_params = { :id => incomming_invoice.id }
    expect(controller.request.fullpath).to eq incomming_invoice_path(incomming_invoice)
  end  
end
