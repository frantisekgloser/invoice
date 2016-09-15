require 'rails_helper'

RSpec.describe "vat_reports/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new VAT report" do

    expect(controller.request.fullpath).to eq new_vat_report_path
  end  
end
