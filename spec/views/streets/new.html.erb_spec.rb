require 'rails_helper'

RSpec.describe "streets/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Street" do

    expect(controller.request.fullpath).to eq new_street_path
  end  
end
