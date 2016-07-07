require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe '#index' do
    let(:current_user) {  }

    before do
      allow(controller).to receive(:current_user).and_return(current_user)
      get :index
    end

    context 'no user is signed in' do
      it { expect(response).to redirect_to new_user_session_path }
    end

    context 'as ordinary user' do
      it { expect(response).to redirect_to new_user_session_path }
    end

    context 'as admin user' do
      let(:current_user) {
        User.new.admin
      }

      it { expect(response.status).to eql 200 }
    end
  end

  describe '#new' do
    before do
      get :new
    end

    it { expect(response.status).to eql 200 }
  end

  describe '#create' do
    let(:params) {
      {
        question: question_params
      }
    }

    before do
      post :create, params
    end

    context 'invalid data' do
      let(:question_params) {
        {
          foo: :bar
        }
      }

      it { expect(response.status).to eql 200 }
      it { expect(Question.count).to eql 0 }
    end

    context 'valid data' do
      let(:supplied_text) { "I'd like to ask something ..." }

      let(:question_params) {
        {
          text: supplied_text
        }
      }

      it { expect(response.status).to eql 302 }
      it { expect(Question.count).to eql 1 }

      describe 'created question' do
        subject { Question.last }

        it { expect(subject.text).to eq(supplied_text) }
      end
    end
  end
end
