class BackerMailer < ActionMailer::Base

	default from: "joshlamb@gmail.com"
  
	def single_backer_email(owner,backer,message)
		@user = user
		@backer = backer
		@message = message
		mail(to: @user, from: @backer, subject: 'Thanks for your support!')
	end

	def
