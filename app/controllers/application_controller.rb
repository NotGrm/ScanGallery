class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_ariane

  protected

  def set_ariane
    ariane.add 'Home', root_path
  end
end
