# frozen_string_literal: true

require './lib/qy_weixin/version'
Gem::Specification.new do |spec|
  spec.name          = 'qy_weixin'
  spec.version       = QyWeixin::VERSION
  spec.homepage      = 'https://github.com/luojie92/qy_weixin'
  spec.authors       = ['luojie92']
  spec.email         = ['luojie@yolanda.hk']
  spec.summary       = 'Shop middleware for QyWeixin.'
  spec.description   = ''
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0")
  # spec.files         =  Dir['CHANGELOG.md', 'LICENSE', 'README.md', 'lib/**/*'']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.4.0'
end
