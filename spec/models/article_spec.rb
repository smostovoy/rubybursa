require 'rails_helper'

RSpec.describe Article, type: :model do

  describe '#published?' do
    subject { create(:article, created_at: created_at).published? }

    context 'when article created more than 1 day ago' do
      let(:created_at) { 2.day.ago }

      it { should be_truthy }
    end

    context 'when article created less than 1 day ago' do
      let(:created_at) { 2.hours.ago }

      it { should be_falsy }
    end
  end

  describe 'associations' do
    let(:article) { create(:article, user: create(:user)) }

    it 'has a user' do
      expect(article.user).to be_a(User)
    end
  end
end
