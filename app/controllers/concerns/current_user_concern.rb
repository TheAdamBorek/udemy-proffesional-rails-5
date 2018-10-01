module CurrentUserConcern
  def current_user
    super || GuestUser.new
  end
end