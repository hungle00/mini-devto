require 'rails_helper'

RSpec.describe "Articles", type: :request do
  current_user = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')
  
  let(:valid_attributes) do
    {
      'id' => '1',
      'title' => 'Test',
      'body' => '12345',
      'user' => current_user
    }
  end

  describe "GET /index" do
    it 'render a successful value' do
      post = Article.new(valid_attributes)
      post.user = current_user
      post.save
      get articles_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "works! (now write some real specs)" do
      get new_article_url
      expect(response).to be_successful
    end
  end
end
