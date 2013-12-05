class BackerMailer < ActionMailer::Base

	default from: "joshlamb@gmail.com"
  
	def single_backer_email(owner,backer,message)
		@owner = owner
		@backer = backer
		@message = message
		mail(to: @backer.email, from: @owner.email, subject: 'Thanks for your support!')
	end
end
