class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_source
  include DeviseWhitelist,
          SourceFromSession,
          CurrentUserConcern

  def set_source
    session[:source] = params[:source] if params[:source]
  end
end
