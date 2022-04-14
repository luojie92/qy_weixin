# frozen_string_literal: true

module QyWeixin
  module Connection
    # User
    module User
      def get_users_by_department(department_id, fetch_child = 0)
        http_get(get_users_by_department_url(department_id, fetch_child))
      end

      def get_user_id(code)
        http_get(user_id_url(code))
      end

      def get_user_info(open_id)
        http_get(user_info_url(open_id))
      end

      private

      def get_users_by_department_url(department_id, fetch_child)
        "https://qyapi.weixin.qq.com/cgi-bin/user/simplelist?access_token=#{get_access_token}&department_id=#{department_id}&fetch_child=#{fetch_child}"
      end

      def user_id_url(code)
        "https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo?access_token=#{get_access_token}&code=#{code}"
      end

      def user_info_url(open_id)
        "https://qyapi.weixin.qq.com/cgi-bin/user/get?access_token=#{get_access_token}&userid=#{open_id}"
      end
    end
  end
end
