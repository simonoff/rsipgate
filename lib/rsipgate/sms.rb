module Sipgate
  class Sms < Base

    TOS = 'text'

    def options(data)
      {
        'Content' => data[0..159]
      }
    end

  end
end
