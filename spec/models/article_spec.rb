require 'rails_helper'

RSpec.describe Article, type: :model do
  current_user = User.first_or_create!(email: 'test@example.com', username: 'test', password: 'password', password_confirmation: 'password')

  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

  it 'has a title' do
    post = Article.new(
      title: '',
      body: 'A Valid Body',
      user: current_user
    )
    expect(post).to_not be_valid

    post.title = 'Has a title'
    expect(post).to be_valid
  end
end
