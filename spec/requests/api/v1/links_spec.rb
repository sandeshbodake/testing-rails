require "rails_helper"

RSpec.describe "GET /api/v1/links" do
	it 'return list of all links, hottest first' do
		coldest_link = create(:link)
		hottest_link = create(:link, upvotes: 2)

		get '/api/v1/links'

		json_body = JSON.parse(response.body)

		# JSON.parse(response.body)

		expect(json_body.count).to eq(2)
		hottest_link_json = json_body[0]

		expect(hottest_link_json).to eq({
			id: hottest_link.id,
			title: hottest_link.title,
			url: hottest_link.url,
			upvotes: hottest_link.upvotes,
			downvotes: hottest_link.downvotes
		})
  end
end