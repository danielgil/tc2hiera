Gem::Specification.new do |s|
  s.name = "tc2hiera"
  s.version = "0.1"
  s.platform = Gem::Platform::RUBY
  s.authors = ["Daniel Gil"]
  s.email = ["daniel.gil at innoveo.com"]
  s.homepage = "https://github.com/danielgil/tc2hiera"
  s.summary = %q{Parse command line input and write it to YAML file.}
  s.description = %q{Simple gem to parse command line input and write it to YAML, f.e. to integrate Teamcity build configurations and Hiera}
  s.executables = ["tc2hiera"]
  s.files = Dir['Rakefile', '{bin,lib,test}/**/*', 'README*', 'LICENSE']
  s.add_dependency("test-unit")
end