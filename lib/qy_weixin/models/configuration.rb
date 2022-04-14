# frozen_string_literal: true

module QyWeixin
  # Configuration
  class Configuration
    OPTIONS = %i[corpid secret redis].freeze
    attr_accessor :corpid, :secret, :redis
  end
end
