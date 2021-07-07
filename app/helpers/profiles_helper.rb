module ProfilesHelper
    # Returns the Gravatar (http://gravatar.com/) for the given user.
  def avatar_for(user, options = { size: 25 })
    #gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    unknown_img = 'https://st3.depositphotos.com/4111759/13425/v/950/depositphotos_134255634-stock-illustration-avatar-icon-male-profile-gray.jpg'
    if user.avatar.attached?
      image_tag(user.avatar, size: options[:size], alt: user.username, class: "rounded-circle border", loading:"lazy")
    else
      image_tag(unknown_img, size: options[:size], alt: user.username, class: "rounded-circle border", loading:"lazy")
    end
  end  
end
