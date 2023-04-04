require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.'
    )
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be present' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  user = User.create(
    name: 'Tom',
    photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
    bio: 'Teacher from Mexico.',
    posts_counter: 3
  )

  context 'three_recent_posts' do
    it 'checks the first three posts' do
      expect(user.posts_counter).to eq(3)
    end
  end
end
