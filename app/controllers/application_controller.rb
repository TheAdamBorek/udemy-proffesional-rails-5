class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_source, :set_default_title
  include DeviseWhitelist,
          SourceFromSession,
          CurrentUserConcern

  def set_source
    session[:source] = params[:source] if params[:source]
  end

  def set_default_title
    @page_title = "Adam's Portfolio"
  end
end
