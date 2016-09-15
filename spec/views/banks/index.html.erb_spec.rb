require 'rails_helper'

RSpec.describe "banks/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Banks" do

    expect(controller.request.fullpath).to eq banks_path
  end  
end
