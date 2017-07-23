class ApplicationController < ActionController::API

  #If no record found, show an error
  rescue_from ActiveRecord::RecordNotFound do
    render json: {"error": "no record found"}, status: 404
  end
  #authentication goes here
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate unless Rails.env == "test"
  
  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user = Admin.find_by(token: token)
    end
  end

  def render_unauthorized(realm = "Application")
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    render json: {:error => "Bad credentials"}, status: :unauthorized
  end
  
end
