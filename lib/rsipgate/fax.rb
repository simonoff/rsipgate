module Sipgate
  class Fax < Base

    # send a fax
    def send(number, pdf_message)
      number.gsub!(/^(\+)/, "")
      number.gsub!(/\s+/, "")
      call "samurai.SessionInitiate",
           'RemoteUri' => "sip:#{number}@sipgate.net",
           'TOS'       => 'fax',
           'Content'   => ::Base64.encode64(pdf_message)
    end
  end
end