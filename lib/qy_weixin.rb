# frozen_string_literal: true

require 'qy_weixin/version'
require 'qy_weixin/models/configuration'
require 'qy_weixin/connection'
require 'qy_weixin/client'

# QyWeixin
module QyWeixin
  class << self
    attr_writer :configuration

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
