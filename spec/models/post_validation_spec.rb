require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(
      title: 'Hello',
      text: 'This is my first post',
      user_id: 1
    )
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'title should not be to long' do
    subject.title = 'a' * 256
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be integer' do
    subject.likes_counter = 'g'
    expect(subject).to_not be_valid
  end

  post = Post.create(
    title: 'my title',
    text: 'Hello World!',
    comments_counter: 5,
    likes_counter: 1
  )
  context 'recent comments' do
    it 'checks five recent comments' do
      expect(post.comments_counter).to eq(5)
    end
  end
end
