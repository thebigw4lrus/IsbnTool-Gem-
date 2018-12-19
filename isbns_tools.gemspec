Gem::Specification.new do |s|
  s.name        = 'isbns_tools'
  s.version     = '1.0.0'
  s.date        = '2013-07-19'
  s.summary     = 'isbns tools'
  s.description = "Isbn Tool - Hyphenizer tool extended with faker isbn functionality"
  s.files       = ["lib/hyphenizer.rb", "lib/function_lib.rb", "lib/faker.rb"]
  s.required_ruby_version = '>= 2.0.0'
  s.add_dependency('libxml-ruby', '>= 2.6.0')
end
