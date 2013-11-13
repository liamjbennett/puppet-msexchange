source "http://rubygems.org"

if ENV.key?('PUPPET_VERSION')
  puppetversion = "= #{ENV['PUPPET_VERSION']}"
else
  puppetversion = ['~> 2.7']
end

gem "rake"
gem "puppet", puppetversion
gem "puppet-lint"
gem "hiera-puppet-helper"
gem "puppetlabs_spec_helper"
gem "ci_reporter"

if puppetversion =~ /2\.7/
  gem "hiera"
  gem "hiera-puppet"
end
