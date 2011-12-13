class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :current_card

		protected
		  def have_access
		   @current_page = :user
		   redirect_to :root if current_user == nil || !current_user.admin?
		  end

    private
      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end
			def current_card
        @current_card ||= session[:card] if session[:card]
      end
end
