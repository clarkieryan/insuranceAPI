class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Adding in some basic exception control here for the ActiveRecord searching
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  private
    def record_not_found
      #Maybe raise an exception? Or is the exception-inception
      render :json => {:error => "404", :description => "Record not found"}
    end

    def record_not_unique
      #TODO add in custom error message here
      render :json => {:error => error.message}, :status => :not_unique
    end
end