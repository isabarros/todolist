require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
  describe "POST #create" do
    let(:list) { create(:list) }
    let(:user) { create(:user) }

    it "returns http success" do
      sign_in user

      post :create, list_id: list

      expect(response).to have_http_status(:success)
      expect(user.favorites_lists).to include(list)
    end
  end
end
