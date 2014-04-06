module ApplicationHelper
  def gravatar_for(user, options = {})
    show_tooltip = options.fetch(:tooltip, false)
    size = options.fetch(:size, 20)
    md5 = Digest::MD5.hexdigest(user.email)
    gravatar_url = "http://www.gravatar.com/avatar/#{md5}.png?d=wavatar&s=#{size * 2}" # doubled for retina

    "<span style='height:#{size}px;width:#{size}px' class='avatar#{" has-tip' data-tooltip title='#{user.email}" if show_tooltip}'>\
       <img src=#{gravatar_url} alt='#{user.email}' style='height:#{size}px;width:#{size}px' />\
     </span>".html_safe
  end
end
