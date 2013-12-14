class PostMailer <ActionMailer::Base
	default from:"ntsinh90@gmail.com"
	def comment_email(poster,commenter,content,url)
		@poster = poster
		@commenter = commenter
		@content = content
		@url = url
		mail(to:poster, subject: "#{commenter+" "+t('.mail_subject')} ")

	end
end