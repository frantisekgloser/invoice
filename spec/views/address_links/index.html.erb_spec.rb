require 'rails_helper'

RSpec.describe "address_links/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Address links" do

    expect(controller.request.fullpath).to eq address_links_path
  end  
end
