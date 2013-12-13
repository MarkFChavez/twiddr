module ApplicationHelper
	def g(user, klass=nil, options={})
		gravatar_image_tag(user.email,alt:user.email,class:klass,gravatar: options)
	end
end
