require 'rails_helper'

RSpec.describe "address_links/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:address_link) {FactoryGirl.create(:address_link)}

  before do
    sign_in user
  end

  it "edits Address link with id: as parameter" do

    controller.extra_params = { :id=>address_link.id }
    expect(controller.request.fullpath).to eq edit_address_link_path(address_link)
  end  
end
