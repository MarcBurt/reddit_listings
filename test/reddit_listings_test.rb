require 'test_helper'
require 'fakeweb'

class RedditListingsTest < ActiveSupport::TestCase

  test "truth" do
    assert_kind_of Module, RedditListings
  end

  setup do
    FakeWeb.register_uri(:get, "http://www.reddit.com/r/ruby+rails/top/.json?limit=2&t=all", :body => '{"kind": "Listing", "data": {"modhash": "34do8o0hwy873bef4969f21cd7e210392db614967aef5b73f3", "children": [{"kind": "t3", "data": {"domain": "twitter.com", "banned_by": null, "media_embed": {}, "subreddit": "ruby", "selftext_html": null, "selftext": "", "likes": null, "secure_media": null, "link_flair_text": null, "id": "1yfeb7", "gilded": 0, "secure_media_embed": {}, "clicked": false, "stickied": false, "author": "micketic", "media": null, "score": 293, "approved_by": null, "over_18": false, "hidden": false, "thumbnail": "", "subreddit_id": "t5_2qh21", "edited": false, "link_flair_css_class": null, "author_flair_css_class": null, "downs": 44, "saved": false, "is_self": false, "permalink": "/r/ruby/comments/1yfeb7/jim_weirich_creator_of_rake_passed_away_today/", "name": "t3_1yfeb7", "created": 1392886180.0, "url": "https://twitter.com/evanphx/status/436408348968120320", "author_flair_text": null, "title": "Jim Weirich, creator of \"rake\" passed away today", "created_utc": 1392886180.0, "ups": 337, "num_comments": 38, "visited": false, "num_reports": null, "distinguished": null}}, {"kind": "t3", "data": {"domain": "imgur.com", "banned_by": null, "media_embed": {}, "subreddit": "ruby", "selftext_html": null, "selftext": "", "likes": null, "secure_media": null, "link_flair_text": null, "id": "l67pa", "gilded": 0, "secure_media_embed": {}, "clicked": false, "stickied": false, "author": "seriouslyawesome", "media": null, "score": 212, "approved_by": null, "over_18": false, "hidden": false, "thumbnail": "", "subreddit_id": "t5_2qh21", "edited": false, "link_flair_css_class": null, "author_flair_css_class": null, "downs": 27, "saved": false, "is_self": false, "permalink": "/r/ruby/comments/l67pa/how_i_feel_about_ryan_bates/", "name": "t3_l67pa", "created": 1318189328.0, "url": "http://imgur.com/lMwLj", "author_flair_text": null, "title": "This test passes!", "created_utc": 1318185728.0, "ups": 239, "num_comments": 23, "visited": false, "num_reports": null, "distinguished": null}}], "after": "t3_l67pa", "before": null}}') #fakes the response from the URI
    FakeWeb.register_uri(:get, "http://www.reddit.com/r/ruby+rails/hot/.json?limit=2", :body => '{"kind": "Listing", "data": {"modhash": "dsf8dwmjs9dd7e3e556e620cde7cc0bd9bc6a818f119085831", "children": [{"kind": "t3", "data": {"domain": "blog.sharetribe.com", "banned_by": null, "media_embed": {}, "subreddit": "ruby", "selftext_html": null, "selftext": "", "likes": null, "secure_media": null, "link_flair_text": null, "id": "273szt", "gilded": 0, "secure_media_embed": {}, "clicked": false, "stickied": false, "author": "rap1ds", "media": null, "score": 17, "approved_by": null, "over_18": false, "hidden": false, "thumbnail": "", "subreddit_id": "t5_2qh21", "edited": false, "link_flair_css_class": null, "author_flair_css_class": null, "downs": 5, "saved": false, "is_self": false, "permalink": "/r/ruby/comments/273szt/option_pattern_maybe_monad_in_ruby/", "name": "t3_273szt", "created": 1401740235.0, "url": "http://blog.sharetribe.com/2014/06/02/option-pattern-maybe-monad-in-ruby/", "author_flair_text": null, "title": "Option pattern (Maybe monad) in Ruby", "created_utc": 1401711435.0, "ups": 22, "num_comments": 3, "visited": false, "num_reports": null, "distinguished": null}}, {"kind": "t3", "data": {"domain": "railsware.com", "banned_by": null, "media_embed": {}, "subreddit": "ruby", "selftext_html": null, "selftext": "", "likes": null, "secure_media": null, "link_flair_text": null, "id": "274b3v", "gilded": 0, "secure_media_embed": {}, "clicked": false, "stickied": false, "author": "gregolsen", "media": null, "score": 1, "approved_by": null, "over_18": false, "hidden": false, "thumbnail": "", "subreddit_id": "t5_2qh21", "edited": false, "link_flair_css_class": null, "author_flair_css_class": null, "downs": 0, "saved": false, "is_self": false, "permalink": "/r/ruby/comments/274b3v/chainflow_refactor_your_data_processing/", "name": "t3_274b3v", "created": 1401753242.0, "url": "http://railsware.com/blog/2014/06/02/chainflow-refactor-your-data-processing/", "author_flair_text": null, "title": "ChainFlow \u2013 refactor your data processing", "created_utc": 1401724442.0, "ups": 1, "num_comments": 0, "visited": false, "num_reports": null, "distinguished": null}}], "after": "t3_274b3v", "before": null}}') 
  end

  test "should be able to retrieve the title of the second post of r/ruby and r/rails in top" do
    @listing = RedditListings.get("ruby+rails", timeframe: "all", total: "2", sort_by: "top")
    assert_match  "This test passes!", @listing[1][:title]
  end

  test "should be able to retrieve the title of the first post in r/ruby and r/rails in hot" do
    @listing = RedditListings.get("ruby+rails", total: "2", sort_by: "hot")
    assert_match  "Option pattern (Maybe monad) in Ruby", @listing[0][:title]
  end

end


