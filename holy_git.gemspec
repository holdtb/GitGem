Gem::Specification.new do |s|
  s.name = 'holy_git'
  s.version = '0.1.1'
  s.date = '2015-07-13'
  s.summary = 'automatically runs tests and amends last commit for passing tests'
  s.description = 'Checks your current working directory to see if there are modified files. Runs rspec tests and if they pass, ammends the previous commit so that you never lose your work'
  s.authors = ['Jordan Dashel', 'Bryan Holdt']
  s.files = Dir['*.rb'] + Dir['README.md'] + Dir['lib/*.rb'] + Dir['lib/parsers/*.rb'] + Dir['spec/*.rb']
  
  s.license = 'MIT'
  s.platform = Gem::Platform.local
  s.require_paths = ['.', './lib/', './lib/parsers/', './spec/']
  
  s.add_dependency 'thor'
end

