require 'rails_helper'

RSpec.describe "payment_types/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Payment type" do

    expect(controller.request.fullpath).to eq new_payment_type_path
  end  
end
