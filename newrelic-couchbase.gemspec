# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'newrelic-couchbase/version'

Gem::Specification.new do |gem|
  gem.name          = "newrelic-couchbase"
  gem.version       = Newrelic::Couchbase::VERSION
  gem.authors       = ["Sohaib Talaat Bhatti"]
  gem.email         = ["sohaibbbhatti@gmail.com"]
  gem.description   = %q{Couchbase Instrumentation for NewRelic RPM}
  gem.summary       = %q{Couchbase NewRelic Instrumentation}
  gem.homepage      = "https://github.com/sohaibbhatti/newrelic-couchbase"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'couchbase'
  gem.add_dependency 'newrelic_rpm'
end
