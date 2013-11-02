module Exceptions

  #Example of a custom error to be outputted
  class MyError < StandardError

    #TODO Add in more error handling for the testing/API
    def initialize (errorCode, message)
      @error = errorCode
      @message = message

      @output = { :error => @erorrCode, :description => @message }
      return @output;
    end

  end

end