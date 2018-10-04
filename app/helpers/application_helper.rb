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
end
