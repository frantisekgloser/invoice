require 'rails_helper'

RSpec.describe "items/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Item" do

    expect(controller.request.fullpath).to eq new_item_path
  end  
end
