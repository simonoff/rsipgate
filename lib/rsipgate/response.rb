module Sipgate
  class Response
  
    CODE_SUCCESS = 200
  
    def initialize(response)
      @response = response
    end
  
    def success?
      status_code == CODE_SUCCESS
    end
    
    %w(session_id session_status status_code status_string).each do |key|
      define_method(key) { @response[key.to_sym] }
    end
    
    # returns the status of a fax transmission. possible answers:
    # :pending, :sent, :failed
    def sending_status
      case session_status
        when "sending", "queued"
          :pending
        when "sent"
          :sent
        when "error during submit", "failed"
          :failed
        else
          raise "Could not determine status of response: #{inspect}"
      end
    end
  end
end