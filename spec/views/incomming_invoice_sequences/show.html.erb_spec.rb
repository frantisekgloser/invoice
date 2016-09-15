require 'rails_helper'

RSpec.describe "incomming_invoice_sequences/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:incomming_invoice_sequence) {FactoryGirl.create(:incomming_invoice_sequence)}

  before do
    sign_in user
  end

  it "shows Incomming invoice sequence with id: as parameter" do

    controller.extra_params = { :id => incomming_invoice_sequence.id }
    expect(controller.request.fullpath).to eq incomming_invoice_sequence_path(incomming_invoice_sequence)
  end  
end
