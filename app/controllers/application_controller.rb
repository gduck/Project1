class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # //need this for now
  $prof_name = ['Beginner', 'Conversational', 'Fluent', 'Native' ]

end
