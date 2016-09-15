require 'rails_helper'

RSpec.describe "day_entries/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:day_entry) {FactoryGirl.create(:day_entry)}

  before do
    sign_in user
  end

  it "shows Day entry with id: as parameter" do

    controller.extra_params = { :id=>day_entry.id }
    expect(controller.request.fullpath).to eq day_entry_path(day_entry)
  end  
end
