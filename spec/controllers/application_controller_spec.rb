require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe "application#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
