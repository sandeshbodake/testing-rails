require "rails_helper"

RSpec.describe "GET /api/v1/links" do
	it 'return list of all links, hottest first' do
		coldest_link = create(:link)
		hottest_link = create(:link, upvotes: 2)

		get '/api/v1/links'

		expect(json_body.count).to eq(2)
		hottest_link_json = json_body[0]

		expect(hottest_link_json) == {
			id: hottest_link.id,
			title: hottest_link.title,
			url: hottest_link.url,
			upvotes: hottest_link.upvotes,
			downvotes: hottest_link.downvotes
		}
  end
end

RSpec.describe 'POST /api/v1/links' do
  it 'create new link' do
  	link_params = attributes_for(:link) # attributes_for is a factory-girl method

  	post "/api/v1/links", link: link_params

  	expect(response.status).to eq 201
  	expect(Link.last.title).to eq link_params[:title]
  end

  context 'when wrong parameter send' do
  	it 'return 422, with errors' do
  		link_params = attributes_for(:link, :invalid)

  		post "/api/v1/links", link: link_params

  		expect(response.status).to eq 422
  		expect(json_body.fetch('errors')).not_to be_empty
  	end
  end
end

