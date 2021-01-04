require 'rails_helper'

RSpec.describe "Articles", type: :request do
  current_user = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')
  
  describe "GET /new" do
    it "works! (now write some real specs)" do
      get new_article_url
      expect(response).to be_successful
    end
  end
end
