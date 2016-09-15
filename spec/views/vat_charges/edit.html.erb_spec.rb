require 'rails_helper'

RSpec.describe "vat_charges/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:vat_charge) {FactoryGirl.create(:vat_charge)}

  before do
    sign_in user
  end

  it "edits VAT charge with id: as parameter" do

    controller.extra_params = { :id => vat_charge.id }
    expect(controller.request.fullpath).to eq edit_vat_charge_path(vat_charge)
  end  
end
