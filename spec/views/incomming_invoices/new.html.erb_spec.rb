require 'rails_helper'

RSpec.describe "incomming_invoices/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Incomming invoice" do

    expect(controller.request.fullpath).to eq new_incomming_invoice_path
  end  
end
