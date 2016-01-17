Gem::Specification.new do |s|
  s.name = 'wh2600'
  s.version = '0.1.0'
  s.date = '2016-01-17'
  s.summary = 'Ruby gem for retrieving live data from Renkforce WH2600 weather station'
  s.description = 'Ruby gem for retrieving live data from Conrad Renkforce WH2600 / FOSHK WH2600 / Froggit WH2601 / Ambient Weather WS-1400 weather station'
  s.authors = ['Krunoslav Husak']
  s.email = 'kruno@binel.hr'
  s.files = ['lib/wh2600.rb']
  s.homepage = 'https://github.com/h00s/wh2600'
  s.license = 'MIT'

  s.add_runtime_dependency 'nokogiri', '~> 1.6'
end