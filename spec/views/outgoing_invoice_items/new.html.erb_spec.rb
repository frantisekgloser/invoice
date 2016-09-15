require 'rails_helper'

RSpec.describe "outgoing_invoice_items/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:outgoing_invoice) {FactoryGirl.create(:outgoing_invoice)}

  before do
    sign_in user
  end

  it "builds new Outgoing invoice item" do

    controller.extra_params = { :outgoing_invoice_id=>outgoing_invoice.id }
    expect(controller.request.fullpath).to eq new_outgoing_invoice_outgoing_invoice_item_path(outgoing_invoice)
  end  
end
