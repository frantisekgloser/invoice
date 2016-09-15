require 'rails_helper'

RSpec.describe "items/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:item) {FactoryGirl.create(:item)}

  before do
    sign_in user
  end

  it "shows Item with id: as parameter" do

    controller.extra_params = { :id => item.id }
    expect(controller.request.fullpath).to eq item_path(item)
  end    
end
