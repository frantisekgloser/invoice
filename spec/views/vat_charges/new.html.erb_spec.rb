require 'rails_helper'

RSpec.describe "vat_charges/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new VAT charge" do

    expect(controller.request.fullpath).to eq new_vat_charge_path
  end  
end
