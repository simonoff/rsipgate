module Sipgate
  class Sms < Base

    # send an sms
    def send(number, text_message)
      number.gsub!(/^(\+)/, "")
      number.gsub!(/\s+/, "")
      call "samurai.SessionInitiate",
           'RemoteUri' => "sip:#{number}@sipgate.net",
           'TOS'       => 'text',
           'Content'   => text_message[0..158]
    end
  end
end
