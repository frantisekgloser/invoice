require 'rails_helper'

RSpec.describe "trade_subjects/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Trade subjects" do

    expect(controller.request.fullpath).to eq trade_subjects_path
  end  
end
