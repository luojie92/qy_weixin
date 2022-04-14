# frozen_string_literal: true

module QyWeixin
  module Connection
    # Template
    module Template
      def send_template_message(template_params)
        http_post(message_template_url, template_params)
      end

      private

      def message_template_url
        "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=#{get_access_token}"
      end
    end
  end
end
