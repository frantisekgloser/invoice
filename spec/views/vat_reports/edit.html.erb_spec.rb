require 'rails_helper'

RSpec.describe "vat_reports/edit.html.erb", type: :view do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    
    if User.where(:email ==  "test@test.com") == []
      @user = User.create!(email: 'test@test.com', password: '12test34', trade_subject: 'test', identification_number: '123', house_number: 1, city: 'test_city', postal_code: '123', country: 'test_country')
    else
      @user = User.where(:email ==  "test@test.com")
    end

    sign_in @user
    @vat_report = VatReport.create!(number: '123', date: '2016-08-09', to_pay: '123', to_receive: '321', note: 'test_vat_report_note', user_id: @user.id)
  end

  it "edits VAT report with id: as parameter" do

    controller.extra_params = { :id => @vat_report.id }
    expect(controller.request.fullpath).to eq edit_vat_report_path(@vat_report)
  end  
end
