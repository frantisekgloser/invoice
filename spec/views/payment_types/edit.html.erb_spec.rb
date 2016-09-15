require 'rails_helper'

RSpec.describe "payment_types/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:payment_type) {FactoryGirl.create(:payment_type)}

  before do
    sign_in user
  end

  it "edits Payment type with id: as parameter" do

    controller.extra_params = { :id => payment_type.id }
    expect(controller.request.fullpath).to eq edit_payment_type_path(payment_type)
  end  
end
