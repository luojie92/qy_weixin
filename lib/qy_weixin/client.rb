# frozen_string_literal: true

require 'monitor'
require 'redis'
require 'digest/md5'

module QyWeixin
  # Client
  class Client
    include Connection::Base
    include Connection::Qrcode
    include Connection::Template
    include Connection::User
    include Connection::Department
    include Connection::Message
    attr_accessor :corpid, :secret, :redis

    def initialize(options = {})
      @corpid = options[:corpid] || QyWeixin.configuration.corpid
      @secret = options[:secret] || QyWeixin.configuration.secret
      @redis  = options[:redis]  || QyWeixin.configuration.redis
    end
  end
end
