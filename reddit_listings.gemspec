$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "reddit_listings/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "reddit_listings"
  s.version     = RedditListings::VERSION
  s.authors     = ["Marc Burt"]
  s.email       = ["marc.burt@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "A gem to simplify capturing listings of one or more subreddits ."
  s.description = "TODO: Description of RedditListings."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.5"

  s.add_development_dependency "sqlite3"
end
