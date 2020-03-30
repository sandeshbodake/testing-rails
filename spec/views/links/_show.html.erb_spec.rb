require "rails_helper"

RSpec.describe 'links/show.html.erb' do
  context 'if url contain image' do
  	it 'render image inline' do
  		link = build(:link, url: 'http://example.com/a.png')
  		assign(:link, link)

  		render

  		expect(rendered).to have_selector "img[src='#{link.url}']"
  	end
  end
end