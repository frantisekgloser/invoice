require 'rails_helper'

RSpec.describe "vat_charges/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:vat_charge) {FactoryGirl.create(:vat_charge)}

  before do
    sign_in user
  end

  it "shows VAT charge with id: as parameter" do

    controller.extra_params = { :id => vat_charge.id }
    expect(controller.request.fullpath).to eq vat_charge_path(vat_charge)
  end  
end
