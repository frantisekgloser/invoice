require 'rails_helper'

RSpec.describe "trade_subjects/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Trade subject" do

    expect(controller.request.fullpath).to eq new_trade_subject_path
  end  
end
