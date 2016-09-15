require 'rails_helper'

RSpec.describe "provinces/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Province" do

    expect(controller.request.fullpath).to eq new_province_path
  end  
end
