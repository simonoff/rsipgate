module Sipgate
  class Base

    PATH = '/RPC2'

    def my_api_host
      Sipgate.api_host || 'samurai.sipgate.net'
    end

    def initialize(user = nil, password = nil)
      user ||= Sipgate.user
      password ||= Sipgate.password
      @client = XMLRPC::Client.new3({
        :host => my_api_host,
        :path => PATH,
        :use_ssl => true,
        :user => user,
        :password => password,
        :port => 443
      })
    end

    # queries the status of a fax
    def status(session_id)
      call "samurai.SessionStatusGet",
           'SessionID' => session_id
    end

    def call(*args)
      response = Response.new(rubyized_hash(@client.call(*args)))
      unless response.success?
        raise ::Sipgate::Exception, "Response failed with #{response.status_string} with code #{response.status_code}"
      end
      response
    end

    def strip(phone_number)
      phone_number.to_s.gsub(/[+\- ]+/, "")
    end

    def perform_transmission(options, sender)
      options.merge!({'LocalUri' => "sip:#{strip(sender)}@sipgate.net"}) if sender
      call "samurai.SessionInitiate", options
    end

    # make server responses look more Ruby like (underscored Symbol as Hash keys)
    def rubyized_hash(h)
      h.inject({}) do |memo, (k, v)|
        value = case v
        when ::Hash
          rubyized_hash(v)
        when ::Array
          v.map {|item| is_a?(::Hash) ? rubyized_hash(item) : item }
        else
          v
        end
        memo[k.to_s.gsub(/(.)([A-Z])/,'\1_\2').downcase.to_sym] = value
        memo
      end
    end
  end
end
