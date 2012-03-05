module Sipgate
  class Sms < Base

    def send(receiver, text, sender=nil)
      options = {
        'RemoteUri' => "sip:#{strip(receiver)}@sipgate.net",
        'TOS'       => 'text',
        'Content'   => text[0..159]
      }

      perform_transmission(options, sender)
    end
  end
end
