module ApplicationHelper
	def formatted_score_for(score)
    "#{value(score)} (+#{score.upvotes}, -#{score.downvotes})"
  end

  private

  def value(score)
  	score.upvotes - score.downvotes
  end
end
