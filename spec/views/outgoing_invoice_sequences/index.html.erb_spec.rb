require 'rails_helper'

RSpec.describe "outgoing_invoice_sequences/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Outgoing invoice sequences" do

    expect(controller.request.fullpath).to eq outgoing_invoice_sequences_path
  end  
end
