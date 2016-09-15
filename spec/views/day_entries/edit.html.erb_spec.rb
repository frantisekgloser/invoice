require 'rails_helper'

RSpec.describe "day_entries/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  let(:day_entry) {FactoryGirl.create(:day_entry)}

  before do
    sign_in user
  end

  it "edits Day entry with id: as parameter" do

    controller.extra_params = { :id=>day_entry.id }
    expect(controller.request.fullpath).to eq edit_day_entry_path(day_entry)
  end  
end
