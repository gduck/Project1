class RegistrationsController < ApplicationController

  protected

  def after_sign_up_path_for_user
    'users/edit'
  end

end
