require 'net/http'
require 'json'

module RedditListings

  def self.listings(subreddit, options = {})
    @subreddit = subreddit
    @limit = options[:total] || "5"
    @time = options[:timeframe] || "day"
    @sort = options[:sort_by] || "top"
    @listings = []
    @n = 0

    @uri = URI('http://www.reddit.com/r/' + @subreddit + '/' + @sort + '/.json?limit=' + @limit + '&t=' + @time)
    @json = JSON.parse(Net::HTTP.get(@uri))        #HTTP.get returns a string which is parsed to JSON
    
    @limit.to_i.times do
      @listings[@n] = { 
        title: @json['data']['children'][@n]['data']['title'], 
        author: @json['data']['children'][@n]['data']['author'], 
        num_comments: @json['data']['children'][@n]['data']['num_comments'], 
        permalink: @json['data']['children'][@n]['data']['permalink'], 
        likes: @json['data']['children'][@n]['data']['likes'], 
        gilded: @json['data']['children'][@n]['data']['gilded'], 
        stickied: @json['data']['children'][@n]['data']['stickied'], 
        score: @json['data']['children'][@n]['data']['score'],
        approved_by: @json['data']['children'][@n]['data']['approved_by'],
        over_18: @json['data']['children'][@n]['data']['over_18'],
        ups: @json['data']['children'][@n]['data']['ups'],
        downs: @json['data']['children'][@n]['data']['downs'],
        is_self: @json['data']['children'][@n]['data']['is_self'],
        created: @json['data']['children'][@n]['data']['created'],
        url: @json['data']['children'][@n]['data']['url'],  
        distinguised: @json['data']['children'][@n]['data']['distinguished'] 
      }

      @n +=1
    end

    @listings
  end
end
