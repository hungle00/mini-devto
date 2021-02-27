module ProfilesHelper
    # Returns the Gravatar (http://gravatar.com/) for the given user.
  def avatar_for(user, options = { size: 250 })
    #gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    #size = options[:size]
    #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    if user.avatar.attached?
      image_tag(user.avatar, size: options[:size], alt: user.username, class: "gravatar")
    end
  end  
end
