require 'rails_helper'

RSpec.describe "trade_subjects/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:trade_subject) {FactoryGirl.create(:trade_subject)}

  before do
    sign_in user
  end

  it "shows Trade subject with id: as parameter" do

    controller.extra_params = { :id => trade_subject.id }
    expect(controller.request.fullpath).to eq trade_subject_path(trade_subject)
  end  
end
