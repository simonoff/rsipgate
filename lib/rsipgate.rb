require 'xmlrpc/client'
require 'base64'
require 'rsipgate/response'
require 'rsipgate/exception'
require 'rsipgate/base'
require 'rsipgate/fax'

module Sipgate
  extend self
  attr_accessor :user, :password, :api_host
end