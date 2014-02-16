module EmailHelper
  def email_button_link(text, url)
    content_tag :table, class: "large-button" do
      content_tag :tr do
        content_tag :td do
          link_to text, url
        end
      end
    end
  end
end
