require 'rails_helper'

RSpec.describe "payment_types/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Payment types" do

    expect(controller.request.fullpath).to eq payment_types_path
  end  
end
