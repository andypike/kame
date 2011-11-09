# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "kame"
  gem.homepage = "http://github.com/andypike/kame"
  gem.license = "MIT"
  gem.summary = %Q{Kame (Japanese for turtle) is an implementation of the Logo programming language for kids}
  gem.description = %Q{Kame (Japanese for turtle) is an implementation of the Logo programming language built as a challenge to myself. I wanted a simple way to introduce programming in Ruby to my daughter and thought this would be fun. With Kame, you control the movement of a turtle around the screen by programming commands. With these simple commands your turtle will draw you a picture. It's a nice introduction to programming for kids and will also help their maths :o)}
  gem.authors = ["Andy Pike"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "kame #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
