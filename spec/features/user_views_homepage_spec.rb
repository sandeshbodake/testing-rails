require "rails_helper"
	RSpec.feature "User views homepage" do
	 scenario "they see existing links" do
	 	link = create(:link)

	 	visit root_path

	 	within "link_#{link.id}" do
	 		click_on "Upvotes"
	 	end

	 	except(page).to have_css "link_#{link.id} [data-role=score]", text: "1"
	end
end