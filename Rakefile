require 'ci/reporter/rake/rspec'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'

PuppetLint.configuration.send("disable_80chars")
PuppetLint.configuration.send("disable_trailing_whitespace")
PuppetLint.configuration.send("disable_class_parameter_defaults")
PuppetLint.configuration.log_format = "%{path}:%{linenumber}:%{check}:%{KIND}:%{message}"
