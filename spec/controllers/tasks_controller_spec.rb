require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe "#create" do
    let(:list) { create(:list) }

    it "returns 200 (ok) if successful" do
      post :create, list_id: list, task: attributes_for(:task),
        format: :js
      expect(response).to be_ok
    end

    it "returns 422 if invalid" do
      post :create, list_id: list, task: { description: nil }, format: :js
      expect(response.status).to eq 422 # unprocessable entity
    end
  end

  describe "#destroy" do
    let(:list) { destroy(:list) }

    it "returns 200 (ok) if successful" do
      delete :destroy, list_id: list, task: attributes_for(:task), format: :js
      expect(response).to be_ok
    end

    it "returns 422 if invalid" do
      delete :destroy, list_id: list, task: { description: nil }, format: :js
      expect(response.status).to eq 422 # unprocessable entity
    end
  end
end
