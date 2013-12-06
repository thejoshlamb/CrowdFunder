module UsersHelper

	def gravatar_for(user,size=200)
		if user.email
	    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
	    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
	    image_tag(gravatar_url, alt: user.username, class: "gravatar")
	  else
	  	image_tag "http://www.gravatar.com/avatar/0?s=#{size}"
  	end

	end
end
