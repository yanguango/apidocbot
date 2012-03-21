# -*- encoding: utf-8 -*-
require File.expand_path('../lib/apidocbot/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["bl0ckme"]
  gem.email         = ["yanguango@gmail.com"]
  gem.description   = %q{Bot to generate api docs}
  gem.summary       = %q{Just write api doc content, and let the bot to generate pretty html file}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "apidocbot"
  gem.require_paths = ["lib"]
  gem.version       = Apidocbot::VERSION
end
