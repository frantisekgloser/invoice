require 'rails_helper'

RSpec.describe "outgoing_invoice_sequences/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:outgoing_invoice_sequence) {FactoryGirl.create(:outgoing_invoice_sequence)}

  before do
    sign_in user
  end

  it "shows Outgoing invoice sequence with id: as parameter" do

    controller.extra_params = { :id => outgoing_invoice_sequence.id }
    expect(controller.request.fullpath).to eq outgoing_invoice_sequence_path(outgoing_invoice_sequence)
  end  
end
