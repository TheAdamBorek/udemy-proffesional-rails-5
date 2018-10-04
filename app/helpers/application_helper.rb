module ApplicationHelper
  def show_login_logout_section
    if current_user.is_authenticated
      link_to 'Log out', destroy_user_session_path, method: :delete
    else
      (link_to 'Log in', new_user_session_path) +
          '<br/>'.html_safe +
          (link_to 'Register', new_user_registration_path)
    end
  end

  def show_source
    unless get_source.blank?
      greeting = "Thanks for visiting my #{get_source}"
      content_tag :p, greeting
    end
  end
end

private
def get_source
  source = session[:source]
  source.capitalize unless source.nil?
end
#
#
# <% unless get_source.blank? %>
#   <p>Thanks for visiting my <%= get_source %></p>
# <% end %>
#
#
