module Exceptions

  #Example of a custom error to be outputted
  class MyError < StandardError

    def initialize (errorCode, message)
      @error = errorCode
      @message = message

      @output = { :error => @erorrCode, :description => @message }
    end

  end

end