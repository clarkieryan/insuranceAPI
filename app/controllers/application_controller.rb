class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Adding in some basic exception control here for the ActiveRecord searching
  rescue_from ActiveRecord::RecordNotFound, :with => record_not_found
  rescue_from ActiveRecord::RecordNotUnique, :with => record_not_unique

  private
    def record_not_found
      render :json => {:error => error.message}, :status => :not_found
    end

    def record_not_unique
      render :json => {:error => error.message}, :status => :not_unique
    end
end
