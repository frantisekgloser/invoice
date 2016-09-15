require 'rails_helper'

RSpec.describe "address_links/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Address link" do

    expect(controller.request.fullpath).to eq new_address_link_path
  end  
end
