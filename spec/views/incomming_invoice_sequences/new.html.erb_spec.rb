require 'rails_helper'

RSpec.describe "incomming_invoice_sequences/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:incomming_invoice_sequence) {FactoryGirl.create(:incomming_invoice_sequence)}

  before do
    sign_in user
  end

  it "builds new Incomming invoice sequence" do

    expect(controller.request.fullpath).to eq new_incomming_invoice_sequence_path
  end  
end
