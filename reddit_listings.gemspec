$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "reddit_listings"
  s.version     = "1.0.1"
  s.authors     = ["Marc Burt"]
  s.email       = ["marc.burt@gmail.com"]
  s.homepage    = "https://github.com/MarcBurt/Reddit_Listings"
  s.summary     = "A gem to simplify capturing listings of one or more subreddits ."
  s.description = "This gem returns an array of up to 100 listings (content posts and self posts) from any subreddit(s) and sorting methods possible."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"

  s.add_development_dependency "sqlite3"
end
