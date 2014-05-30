require 'test_helper'

class RedditListingsTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, RedditListings
  end

  test "should be able to retrieve the title of the second post of r/ruby in all" do
    @listing = RedditListings.listings("ruby", timeframe: "all", total: "2", sort_by: "top")
    assert_match  "How I Feel About Ryan Bates", @listing[1][:title]
  end
end
