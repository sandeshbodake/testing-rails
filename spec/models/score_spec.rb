require "rails_helper"

RSpec.describe '#upvotes' do
  it 'check whther upvotes are correctly' do
  	link = Link.new(:link, upvotes: 10)

  	score = Score.new(link)

  	expect(score.upvotes).to eq(10)
  end
end

RSpec.describe '#upvotes double' do
  it 'is upvotes the link' do
  	link = double(upvotes: 10, downvotes: 0)
  	score = Score.new(link)

  	expect(score.upvotes).to eq 10
  end
end

RSpec.describe '#downvotes double' do
  it 'is downvotes the link' do
  	link = double(upvotes: 0, downvotes: 5)
  	score = Score.new(link)

  	expect(score.downvotes).to eq 5
  end
end