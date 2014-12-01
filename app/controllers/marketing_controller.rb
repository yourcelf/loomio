class MarketingController < ApplicationController
   end
  def index
    if current_user_or_visitor.is_logged_in?
     redirect_to dashboard_path
    elsif ENV['SHOW_LOOMIO_ORG_MARKETING']
     render layout: false
    else
     redirect_to new_user_session_path
    end
  end
end
