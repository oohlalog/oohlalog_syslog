# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oohlalog_syslog/version'

Gem::Specification.new do |spec|
  spec.name          = "oohlalog_syslog"
  spec.version       = OohlalogSyslog::VERSION
  spec.authors       = ["David Estes"]
  spec.email         = ["destes@bcap.com"]
  spec.description   = "Log File Watcher Daemon Written in ruby"
  spec.summary       = "Monitors log files as specified in etc config"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "oohlalog"
  spec.add_dependency "daemons"
  spec.add_dependency "file-tail"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
