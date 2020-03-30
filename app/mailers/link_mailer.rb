class LinkMailer < ApplicationMailer
	MODERATOR_EMAILS = "sandeshbodake121@gmail.com"
	default from: "noreply@reddat.com"

	def new_link(link)
		@link = link
		mail(to: MODERATOR_EMAILS, subject: "New link submitted")
	end
end