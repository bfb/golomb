require File.join([File.dirname(__FILE__),'lib','golomb','version.rb'])
require File.join([File.dirname(__FILE__),'lib','golomb','decoder.rb'])
require File.join([File.dirname(__FILE__),'lib','golomb','encoder.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'golomb'
  s.version = Golomb::VERSION
  s.author = 'Bruno Flach Bohn'
  # s.email = 'your@email.address.com'

  s.platform = Gem::Platform::RUBY
  s.summary = 'A description of your project'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','golomb.rdoc']
  s.rdoc_options << '--title' << 'golomb' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'golomb'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_development_dependency('terminal-table')
  s.add_runtime_dependency('gli','2.13.2')
end
