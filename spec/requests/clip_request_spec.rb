require 'rails_helper'

RSpec.describe "Clips", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/clip/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/clip/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
