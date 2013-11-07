class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Adding in some basic exception control here for ActiveRecord
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from ActiveRecord::RecordNotUnique, :with => :record_not_unique
  #rescue_from ActiveRecord::RecordInvalid, :with => :validation_error

  private
    #Called when a record is not found
    def record_not_found(e)
      render :json => {:error => "404", :description => e.message}
    end

    #Called when the record is not unique
    def record_not_unique(e)
      render :json => {:error => '400', :description => e.message}
    end

    #Called when there is a validation error
    def validation_error(e)
      render :json => {:error => "400", :description => e.message}
    end
end