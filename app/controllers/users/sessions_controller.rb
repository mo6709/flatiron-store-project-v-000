class Users::SessionsController < Devise::SessionsController
before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end
  

  # POST /resource/sign_in
  def create
    super
    # user = User.find_by(:email => params[:user][:email])
    # if user && user.valid_password?(params[:user][:password])
    #     session[:user_id] = user.id
    #     user.current_cart ||= Cart.create(:user => user)
    #     redirect_to store_path
    # else
    #   redirect_to new_user_session_path
    # end     
    
  end
  
  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :attribute

    # devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    #   user_params.permit({ roles: [] }, :email, :password, :password_confirmation)
    # end
  end
end
