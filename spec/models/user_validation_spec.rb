require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      Name: 'Tom',
      Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      Bio: 'Teacher from Mexico.'
    )
  end

  before { subject.save }

  it 'Name should be present' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be present' do
    subject.PostsCounter = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be greater than or equal to zero' do
    subject.PostsCounter = -1
    expect(subject).to_not be_valid
  end
end
