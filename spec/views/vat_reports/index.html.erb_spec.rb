require 'rails_helper'

RSpec.describe "vat_reports/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "displays index of VAT reports" do

    expect(controller.request.fullpath).to eq vat_reports_path
  end  
end
