class ApplicationController < ActionController::API
  include ActionController::Cookies
  before_action :authorize
  
  private 
  
  def authorize
    render json: {errors: ["Invalid username or password"]},status: :unauthorized unless session.include? :user_id
  end

end
