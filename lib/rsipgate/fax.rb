module Sipgate
  class Fax < Base

    # send a fax
    def send(sender, receiver, pdf_file)
      sender.gsub!(/[+]|\s+/, "")
      receiver.gsub!(/[+]|\s+/, "")
      call "samurai.SessionInitiate",
           'LocalUri'  => "sip:#{sender}@sipgate.net",
           'RemoteUri' => "sip:#{receiver}@sipgate.net",
           'TOS'       => 'fax',
           'Content'   => ::Base64.encode64(pdf_file)
    end
  end
end
