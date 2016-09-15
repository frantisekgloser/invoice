require 'rails_helper'

RSpec.describe "payments/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:payment) {FactoryGirl.create(:payment)}

  before do
    sign_in user
  end

  it "edits Payment with id: as parameter" do

    controller.extra_params = { :id => payment.id }
    expect(controller.request.fullpath).to eq edit_payment_path(payment)
  end  
end
