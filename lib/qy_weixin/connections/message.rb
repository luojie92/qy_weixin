# frozen_string_literal: true

module QyWeixin
  module Connection
    # Message
    module Message
      def send_message(body)
        http_post(send_url, body)
      end

      private

      def send_url
        "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=#{get_access_token}"
      end
    end
  end
end
