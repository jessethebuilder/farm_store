$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "farm_store/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "farm_store"
  s.version     = FarmStore::VERSION
  s.authors     = ["Jesse Farmer"]
  s.email       = ["jesse@anysoft.us"]
  s.homepage    = "anysoft.us"
  s.summary     = "TODO: Summary of FarmStore."
  s.description = "TODO: Description of FarmStore."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency 'devise', "~> 3.0"
  s.add_development_dependency "pg"


end
