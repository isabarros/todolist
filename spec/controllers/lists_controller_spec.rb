require 'rails_helper'

RSpec.describe ListsController do
	let(:list) { create(:list) }

	describe "#publish" do
		context "when the parameters are valid" do
			it "invokes List#update_attribute" do
				expect_any_instance_of(List).to receive(:update_attribute).
					with(:public, true)

				put :publish, id: list.id, format: :js
			end

			it "renders create js template" do
				put :publish, id: list.id, format: :js

				expect(response).to render_template(:publish)
			end

			it "returns status 200" do
				put :publish, id: list.id, format: :js

				expect(response.status).to eq(200)				
			end
			#PUT /lists/:id/publish lists#publish				
		end

		context "when there are invalid parameters" do
			it "show a danger flash message" do
			end

			it "redirect to list page" do
			end
		end
	end
end