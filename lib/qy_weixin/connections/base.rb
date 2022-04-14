# frozen_string_literal: true

module QyWeixin
  module Connection
    # Base
    module Base
      def http_post(url, params)
        uri = URI(url)
        req = Net::HTTP.new(uri.host, uri.port)
        req.use_ssl = true
        res = req.post("#{uri.path}?#{uri.query}", params.to_json)
        handle_res(res)
      end

      def http_get(url)
        uri = URI(url)
        req = Net::HTTP.new(uri.host, uri.port)
        req.use_ssl = true
        res = req.get("#{uri.path}?#{uri.query}")
        handle_res(res)
      end

      def get_access_token
        if redis.nil?
          access_token_res = get_token(corpid, secret)
          access_token = access_token_res['access_token']
        else
          access_token = redis.get('qywx_access_token')
          if access_token.nil?
            access_token_res = get_token(corpid, secret)
            access_token = access_token_res['access_token']
            raise StandardError, "QyWeixin access token authorize false, corpid: #{corpid}" if access_token.nil?

            redis.set('qywx_access_token', access_token)
            redis.expire('qywx_access_token', 7200)
          end
        end
        access_token
      end

      private

      def get_token(app_id, app_secret)
        http_get(token_url(app_id, app_secret))
      end

      def token_url(corpid, secret)
        "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=#{corpid}&corpsecret=#{secret}"
      end

      def handle_res(res)
        return JSON.parse(res.body) if res.code == '200'

        { code: res.code }.to_json
      end
    end
  end
end
