require 'rails_helper'

RSpec.describe "report_types/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:report_type) {FactoryGirl.create(:report_type)}

  before do
    sign_in user
  end

  it "edits Report type with id: as parameter" do

    controller.extra_params = { :id => report_type.id }
    expect(controller.request.fullpath).to eq edit_report_type_path(report_type)
  end  
end
