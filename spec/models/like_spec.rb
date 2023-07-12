require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "validations" do
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    let!(:like) { create(:like, user: user, post: post) }

    it { should validate_uniqueness_of(:user_id).scoped_to(:post_id) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end