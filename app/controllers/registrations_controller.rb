class RegistrationsController < Devise::RegistrationsController
  
  def after_sign_up_path_for(user)
    '/lists'
  end
end