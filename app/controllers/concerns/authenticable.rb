module Authenticable


  def current_user
      @account ||= Account.where(:form_name => Base64.decode64(params['id']),:domain_name => params['domain'] )
  end
  
  def authenticate_with_token!
    render json: { errors: "Not authenticated" },
                status: :unauthorized unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end

end #end of module
