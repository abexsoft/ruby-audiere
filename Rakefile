require 'rubygems/package_task'
require 'rake/clean'

#
# Download sources.
#
desc 'Download a source package.'
task :download do
  FileUtils::mkdir_p('ext/src')
  chdir('ext/src') {
    sh "svn co https://audiere.svn.sourceforge.net/svnroot/audiere/trunk/audiere audiere"
  }
end

#
# Compile libraries.
#
desc 'Compile libraries and install into etc/src/build.'
task :compile do
  chdir("ext/src/audiere/") {
    sh "./bootstrap"
    sh "./configure --prefix=$PWD/../build --enable-shared=no"
    sh "make && make install"
  }
end

#
# Extension
#

DLEXT = RbConfig::MAKEFILE_CONFIG['DLEXT']

desc 'Build the extension'
task :build => "lib/Audiere.#{DLEXT}"

file "lib/Audiere.#{DLEXT}" => "ext/Audiere.#{DLEXT}" do |f|
  FileUtils::mkdir_p('lib/')
  cp f.prerequisites, "lib/", :preserve => true
end

file "ext/Audiere.#{DLEXT}" => FileList["ext/Makefile"] do |f|
  sh 'cd ext && make clean && make'
end
CLEAN.include 'ext/*.{o,so,dll}'

file 'ext/Makefile' => FileList['ext/interface/audiere_wrap.cpp'] do
  chdir('ext') { ruby 'extconf.rb' }
end
CLEAN.include 'ext/Makefile'

file 'ext/interface/audiere_wrap.cpp' do
  chdir('ext/interface') { sh 'make' }
end
CLEAN.include 'ext/interface/audiere_wrap.{cpp,h,o}'

#
# Document
#
desc 'Create documents'
task :doc => 'ext/interface/audiere_wrap.cpp' do
  sh 'rdoc ext/interface/audiere_wrap.cpp'
end

#
# Gemspec
#
spec = Gem::Specification.new do |s|

  s.name        = "ruby-audiere"
  s.version     = "0.0.1"
  s.summary     = "A ruby wrapper of Audiere."
  s.homepage    = "https://github.com/abexsoft/ruby-audiere"
  s.authors     = ["abexsoft works"]
  s.email       = ["abexsoft@gmail.com"]
  s.description = "A ruby wrapper of Audiere."
  s.platform    = Gem::Platform::CURRENT
 
  # The list of files to be contained in the gem 
  s.files = FileList['Rakefile',
                     'lib/*',
                     'ext/extconf.rb',
                     'ext/interface/Makefile',
                     'ext/interface/*.i',
                     'sample/*'
                    ].to_a

  s.require_paths = ["lib"]
  s.rubyforge_project = s.name
end

Gem::PackageTask.new(spec) do |pkg|
end
