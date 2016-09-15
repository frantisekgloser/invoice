require 'rails_helper'

RSpec.describe "vat_charges/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of VAT charges" do

    expect(controller.request.fullpath).to eq vat_charges_path
  end  
end
