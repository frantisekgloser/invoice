require 'rails_helper'

RSpec.describe "items/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:item) {FactoryGirl.create(:item)}

  before do
    sign_in user
  end

  it "edits Item with id: as parameter" do

    controller.extra_params = { :id => item.id }
    expect(controller.request.fullpath).to eq edit_item_path(item)
  end  
end
