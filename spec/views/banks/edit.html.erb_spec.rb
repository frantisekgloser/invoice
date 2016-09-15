require 'rails_helper'

RSpec.describe "banks/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:bank) {FactoryGirl.create(:bank)}

  before do
    sign_in user
  end

  it "edits Bank with id: as parameter" do

    controller.extra_params = { :id=>bank.id }
    expect(controller.request.fullpath).to eq edit_bank_path(bank)
  end  
end
