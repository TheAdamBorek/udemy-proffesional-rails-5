class GuestUser
  def initialize
    @name = "Guest"
  end

  def first_name
    @name
  end

  def last_name
    ""
  end

  def email
    ""
  end

  def is_authenticated
    false
  end
end