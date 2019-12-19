module UsersHelper
  def gravatar_for(user, size:80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def user_post_count(user)
    if user.count.zero?
      p 'No post written'
    elsif user.count.positive?
      p "Post written: #{pluralize(user.count, 'post')}"
    end
  end
end
