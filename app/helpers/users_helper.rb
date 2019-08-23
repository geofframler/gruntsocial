module UsersHelper

  #Returns the Gravatar for the given users
  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  #def gravatar_for(user, options = {})
  #options = { :size => 50 }.merge(options)
  #options[:default] = image_tag("default_gravatar_#{options[:size]}.png
  #gravatar_image_tag(user.email.downcase,
  #                   :alt => user.full_name,
  #                   :class => 'gravatar',
  #                   :gravatar => options)
  #end

end
