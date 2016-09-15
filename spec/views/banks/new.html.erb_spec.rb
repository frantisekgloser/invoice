require 'rails_helper'

RSpec.describe "banks/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Bank" do

    expect(controller.request.fullpath).to eq new_bank_path
  end  
end
