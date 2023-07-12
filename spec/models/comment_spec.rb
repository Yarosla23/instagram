require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { should belong_to(:post) }
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_least(3).is_at_most(1000) }
  end
end