require 'rails_helper'

RSpec.describe "report_types/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Report type" do

    expect(controller.request.fullpath).to eq new_report_type_path
  end  
end
