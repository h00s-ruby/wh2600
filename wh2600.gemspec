# encoding: utf-8

require File.expand_path('../lib/wh2600', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'wh2600'
  gem.version       = '0.0.1'
  gem.date          = '2016-01-16'

  gem.summary       = 'Ruby gem for retrieving live data from Renkforce WH2600 weather station'
  gem.description   = 'Ruby gem for retrieving live data from Conrad Renkforce WH2600 / FOSHK WH2600 / Froggit WH2601 / Ambient Weather WS-1400 weather station'
  gem.license       = 'MIT'
  gem.authors       = ['Krunoslav Husak']
  gem.email         = 'kruno@binel.hr'
  gem.homepage      = 'https://github.com/h00s/wh2600'

  gem.files         = ['lib/wh2600.rb']
  gem.require_paths = ['lib']
end
