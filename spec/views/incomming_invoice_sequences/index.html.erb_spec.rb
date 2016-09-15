require 'rails_helper'

RSpec.describe "incomming_invoice_sequences/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:incomming_invoice_sequence) {FactoryGirl.create(:incomming_invoice_sequence)}

  before do
    sign_in user
  end

  it "shows index of Incomming invoice sequences" do

    expect(controller.request.fullpath).to eq incomming_invoice_sequences_path
  end  
end
