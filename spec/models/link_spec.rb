RSpec.describe Link, "#upvotes" do
	it "increments upvotes" do
		link = build(:link, upvotes: 1)
		link.upvote
		
		expect(link.upvotes).to eq 2
	end

	it "return a links hottest to coldest" do 		
		coldest_link = create(:link, upvotes: 3, downvotes: 3)
		hottest_link = create(:link, upvotes: 5, downvotes: 1)
		lukewarm_link = create(:link, upvotes: 2, downvotes: 1)

		expect(Link.hottest_first).to eq [hottest_link, lukewarm_link, coldest_link]
	end
end