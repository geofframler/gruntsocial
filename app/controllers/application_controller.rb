class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def sitename
    render html: "Grunt"
  end

end
