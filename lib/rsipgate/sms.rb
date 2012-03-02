module Sipgate
  class Sms < Base

    # send an sms
    def send(sender, receiver, text)
      sender.gsub!(/[+]|\s+/, "")
      receiver.gsub!(/[+]|\s+/, "")
      call "samurai.SessionInitiate",
           'LocalUri'  => "sip:#{sender}@sipgate.net",
           'RemoteUri' => "sip:#{receiver}@sipgate.net",
           'TOS'       => 'text',
           'Content'   => text[0..159]
    end
  end
end
