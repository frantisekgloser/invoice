require 'rails_helper'

RSpec.describe "payments/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:payment) {FactoryGirl.create(:payment)}

  before do
    sign_in user
  end

  it "shows Payment with id: as parameter" do

    controller.extra_params = { :id => payment.id }
    expect(controller.request.fullpath).to eq payment_path(payment)
  end  
end
