# -*- ruby -*-

# OK, this is weird.
#
# This gem spec is a minimized demonstration of JRUBY-6422 from a more
# complex project. In reduced form it looks rather contrived, but none
# the less there appears to be a real regression here for which there
# is no great workaround in the original.

# See the rdoc require below, but uncommenting this will also make
# the problem go away. Note that rdoc has this same json dependency
# itself, but somehow the order/nesting matters
# gem 'json', '~> 1.4'

# Commenting this rdoc require out will make the problem go away:
gem 'rdoc', '~> 3.12'

require File.expand_path('../lib/broken-bundler/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["David Kellum"]
  gem.email         = ["dek-oss@gravitext.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "broken-bundler"
  gem.require_paths = ["lib"]
  gem.version       = Broken::Bundler::VERSION

  # To demonstrate the problem, make sure hashie is not already
  # installed in your home gem repo, such that
  # "jruby -S bundle install --path=~/.gem" will attempt to install it.
  gem.add_runtime_dependency( "hashie", '~> 1.1.0' )
end
