require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/blog/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/blog/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/blog/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/blog/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
