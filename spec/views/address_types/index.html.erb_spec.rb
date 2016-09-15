require 'rails_helper'

RSpec.describe "address_types/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Address types" do

    expect(controller.request.fullpath).to eq address_types_path
  end  
end
