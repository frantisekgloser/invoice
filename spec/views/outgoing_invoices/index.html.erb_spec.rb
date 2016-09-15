require 'rails_helper'

RSpec.describe "outgoing_invoices/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Outgoing invoices" do

    expect(controller.request.fullpath).to eq outgoing_invoices_path
  end  
end
