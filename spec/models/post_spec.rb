require "rails_helper"

RSpec.describe Post, type: :model do
  it { should have_many(:comments) }
  it { should validate_length_of(:title).is_at_least(5).on(:create) }
  it { should validate_presence_of(:title)}
end