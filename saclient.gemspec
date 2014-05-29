# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'saclient/version'

Gem::Specification.new do |gem|
  gem.name          = "saclient"
  gem.version       = Saclient::VERSION
  gem.authors       = ["townewgokgok"]
  gem.email         = ["townewgokgok@gmail.com"]
  gem.description   = %q{An easy interface to control your resources on SAKURA Cloud.}
  gem.summary       = %q{SAKURA Internet API Client Library for Ruby}
  gem.homepage      = "http://cloud.sakura.ad.jp/"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
