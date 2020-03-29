class Link < ActiveRecord::Base
	validates :title, presence: true
  validates :url, presence: true
  before_create :initialize_upvotes_downvotes

  IMAGE_FORMATS = %w(.jpg .gif .png)

  def initialize_upvotes_downvotes
    self.upvotes = 0 unless upvotes.present?
    self.downvotes = 0 unless downvotes.present?
  end

  def upvote
  	increment!(:upvotes, 1)
  end

  def downvote
    increment!(:downvotes, 1)
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