module Sipgate
  class Fax < Base

    TOS = "fax"

    def options(data)
      {
        'Content' => ::Base64.encode64(data)
      }
    end

  end
end
