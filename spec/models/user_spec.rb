require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#admin, #admin?' do
    let(:user) { User.new }

    context 'is admin' do
      it {
        expect(user.admin).to eq user
        expect(user.admin?).to eql true
      }
    end

    context 'is not admin' do
      it { expect(user.admin?).to eql false }
    end
  end
end
