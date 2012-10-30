class PagesController < ActionController::Base
  def index
    unless user_signed_in?
      redirect_to welcome_url and return
    end
    @locations = Location.not_in_user_locations(current_user)
    
    render :index, :layout => 'application'
  end
end
