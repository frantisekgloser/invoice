require 'rails_helper'

RSpec.describe "incomming_invoices/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Incomming invoices" do

    expect(controller.request.fullpath).to eq incomming_invoices_path
  end  
end
