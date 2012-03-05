module Sipgate
  class Fax < Base

    def send(receiver, pdf_file, sender=nil)
      options = {
        'RemoteUri' => "sip:#{strip(receiver)}@sipgate.net",
        'TOS'       => 'fax',
        'Content'   => ::Base64.encode64(pdf_file)
      }

      perform_transmission(options, sender)
    end
  end
end
