require 'rails_helper'

RSpec.describe "incomming_invoice_items/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:incomming_invoice) {FactoryGirl.create(:incomming_invoice)}

  before do
    sign_in user
  end

  it "shows index of Incomming invoice items" do

    controller.extra_params = { :incomming_invoice_id => incomming_invoice.id }
    expect(controller.request.fullpath).to eq incomming_invoice_incomming_invoice_items_path(incomming_invoice)
  end  
end
