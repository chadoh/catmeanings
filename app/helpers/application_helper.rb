module ApplicationHelper
  def gravatar_for(user, options = {})
    show_tooltip = options.fetch(:tooltip, true)
    md5 = Digest::MD5.hexdigest(user.email)
    gravatar_url = "http://www.gravatar.com/avatar/#{md5}.png?d=wavatar&s=20"
    "<span class='avatar#{show_tooltip ? " has-tip' data-tooltip title='#{user.email}'" : "'"}>\
       <img src=#{gravatar_url} alt='#{user.email}' />\
     </span>".html_safe
  end
end
