# frozen_string_literal: true

module QyWeixin
  module Connection
    # Qrcode
    module Qrcode
      def get_limited_qr(scene_id)
        post_params = { 'expire_seconds': 3600, 'action_name': 'QR_SCENE', 'action_info': { 'scene': { 'scene_id': scene_id } } }
        http_post(qrcode_create_url, post_params)
      end

      private

      def qrcode_create_url
        "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=#{get_access_token}"
      end
    end
  end
end
