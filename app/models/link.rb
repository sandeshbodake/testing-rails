class Link < ActiveRecord::Base
	validates :title, presence: true
  validates :url, presence: true
  IMAGE_FORMATS = %w(.jpg .gif .png)

  def upvote
  	increment!(:upvotes, 1)
  end

  def self.hottest_first
    order("upvotes - downvotes DESC")
  end

  def score
    Score.new(self)
  end

  def image?
    url.end_with? *IMAGE_FORMATS
  end
end