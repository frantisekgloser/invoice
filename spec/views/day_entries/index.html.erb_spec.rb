require 'rails_helper'

RSpec.describe "day_entries/index.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "shows index of Day entries" do

    expect(controller.request.fullpath).to eq day_entries_path
  end  
end
