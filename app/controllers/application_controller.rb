class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :populate_tags

  protected

  def populate_tags
    @cattegories = Cattegory.all
  end
end
