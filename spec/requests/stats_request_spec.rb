require 'rails_helper'

RSpec.describe "Stats", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/stats/index"
      expect(response).to have_http_status(:success)
    end
  end

end
