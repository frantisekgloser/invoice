require 'rails_helper'

RSpec.describe "address_types/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Address type" do

    expect(controller.request.fullpath).to eq new_address_type_path
  end  
end
