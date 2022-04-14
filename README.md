# qy_weixin
Shop middleware for QyWeixin

https://rubygems.org/gems/qy_weixin

[![Gem Version](https://badge.fury.io/rb/qy_weixin.svg)](http://badge.fury.io/rb/qy_weixin)

**有问题请及时提issue**

https://github.com/luojie92/qy_weixin/issues

## Getting started

Add this line to your application's Gemfile:

```ruby
gem 'qy_weixin'
```

You can connect to QyWexinClient by instantiating the Redis class:

```ruby
QyWexinClient = YolQyWeixin::Client.new(
  corpid : qy_weixin_config["corpid"],
  secret : qy_weixin_config["secret"],
  redis  : RedisClient
)
```
configuration：

`corpid`：[https://developer.work.weixin.qq.com/document/path/90665#corpid](https://developer.work.weixin.qq.com/document/path/90665#corpid)

`secret`：[https://developer.work.weixin.qq.com/document/path/90665#secret](https://developer.work.weixin.qq.com/document/path/90665#secret)

****RedisClient为redis实例，如果没有配置可传nil，建议使用redis，考虑到access_token获取次数限制；****

## Support methods

get access_token:
```ruby
QyWexinClient.get_access_token

# => "IFYJSh2oZ4MdWCZsuV-GF_zt...vXbfmgOkkM4ZkJLCb19MuLY5pMFKj4_w"
```

get user_id:
```ruby
QyWexinClient.get_user_id(code)

# => { "errcode": 0, "errmsg": "ok", "UserId":"USERID"}
```
**params:**

`code`：https://developer.work.weixin.qq.com/document/path/91019


get user_info:
```ruby
QyWexinClient.get_user_info(userid)

# => {"errcode"=>0, "errmsg"=>"ok", "userid"=>"333", "name"=>"罗xx", "department"=>[233], "position"=>"系统开发工程师", "mobile"=>"185xxxx0248", "gender"=>"1", "email"=>"", "avatar"=>"", "status"=>1, "isleader"=>0, "extattr"=>{}} 
```

get department_list:
```ruby
QyWexinClient.department_list(department_id)

# =>  {"errcode"=>0, "errmsg"=>"ok", "department"=>[{"id"=>2, "name"=>"业务部", "parentid"=>1, "order"=>100000000, "department_leader"=>[]}]}

```
`department_id`：不传或传0获取所有部门；

get get_users_by_department:
```ruby
QyWexinClient.get_users_by_department(department_id, fetch_child)

# => {"errcode"=>0, "errmsg"=>"ok", "userlist"=>[{"userid"=>"ChenxYun", "name"=>"陈x云", "department"=>[4]}, {"userid"=>"ZhuxDian", "name"=>"朱x点", "department"=>[4]}, {"userid"=>"LuoxJie", "name"=>"罗x杰", "department"=>[4]}]} 

```
`fetch_child`：1/0：是否递归获取子部门下面的成员，不传默认0；

---

## 支持

  如果你觉得我的gem对你有帮助，可以动动小手右上角点个`starred`:star::star::star:，:star:感谢你的关注:star:

