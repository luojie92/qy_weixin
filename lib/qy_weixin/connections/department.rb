# frozen_string_literal: true

module QyWeixin
  module Connection
    # Department
    module Department
      def department_list(department_id = 0)
        http_get(department_list_url(department_id))
      end

      private

      def department_list_url(department_id)
        "https://qyapi.weixin.qq.com/cgi-bin/department/list?access_token=#{get_access_token}&id=#{department_id}"
      end
    end
  end
end
