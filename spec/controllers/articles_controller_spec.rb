require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  render_views

  describe "#index" do
    let!(:article) { create(:article) }

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "loads all of the posts into @posts" do
      get :index
      expect(assigns(:articles)).to match_array([article])
    end
  end
end
