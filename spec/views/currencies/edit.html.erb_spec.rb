require 'rails_helper'

RSpec.describe "currencies/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:currency) {FactoryGirl.create(:currency)}

  before do
    sign_in user
  end

  it "edits Currency with id: as parameter" do

    controller.extra_params = { :id=>currency.id }
    expect(controller.request.fullpath).to eq edit_currency_path(currency)
  end  
end
