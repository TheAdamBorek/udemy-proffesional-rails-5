module SourceFromSession
  extend ActiveSupport::Concern
  included do
    helper_method :get_source
  end

  def get_source
    source = session[:source]
    source.capitalize unless source.nil?
  end
end