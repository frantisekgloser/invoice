require 'rails_helper'

RSpec.describe "day_entries/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in user
  end

  it "builds new Day entry with id: as parameter" do

    expect(controller.request.fullpath).to eq new_day_entry_path
  end  
end
