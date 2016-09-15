require 'rails_helper'

RSpec.describe "banks/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:bank) {FactoryGirl.create(:bank)}

  before do
    sign_in user
  end

  it "shows Bank with id: as parameter" do

    controller.extra_params = { :id=>bank.id }
    expect(controller.request.fullpath).to eq bank_path(bank)
  end  
end
