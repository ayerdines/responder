require 'rails_helper'

RSpec.describe FilesController, type: :controller do
  describe "responds to" do
    it "HTML by default" do
      get :quote
      expect(response.content_type).to eq "text/html"
    end

    it "JSON format when provided" do
      get :quote, format: :json
      expect(response.content_type).to eq "application/json"
    end

    it "XML format when provided" do
      get :quote, format: :xml
      expect(response.content_type).to eq "application/xml"
    end
  end

  describe "GET /quote" do
    it "has a 200 status code" do
      get :quote
      expect(response.status).to eq(200)
    end

    it "returns JSON response" do
      get :quote, :format => :json
      expect(JSON.parse(response.body).try(:[], 'title')).not_to be_nil
    end

    it "renders the quote template" do
      get :quote
      expect(response).to render_template("quote")
      expect(response.body).to eq ""
    end
  end
end
