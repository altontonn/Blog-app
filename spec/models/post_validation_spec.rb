require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(
      Title: 'Hello',
      Text: 'This is my first post',
      user_id: 1
    )
  end

  before { subject.save }

  it 'title should be present' do
    subject.Title = nil
    expect(subject).not_to be_valid
  end

  it 'title should not be to long' do
    subject.Title = 'a' * 256
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter should be greater than or equal to zero' do
    subject.CommentsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'LikesCounter should be integer' do
    subject.LikesCounter = 'g'
    expect(subject).to_not be_valid
  end
end
