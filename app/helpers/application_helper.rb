module ApplicationHelper
  def markdown(text)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    @markdown.render(text).html_safe
  end

  # generates the gravatar img url from the user's email.
  #
  #   <%= image_tag gravatar_url("you@youremail.com", 64), alt: "" %>
  #
  def gravatar_url(email, size)
    gravatar = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar}.png?s=#{size}"
  end
end
