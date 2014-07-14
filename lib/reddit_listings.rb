require 'net/http'
require 'json'

module RedditListings

  def self.get(subreddit, options = {})
    subreddit = subreddit
    limit = options[:total] || "5"
    time = options[:timeframe] || "day"
    sort = options[:sort_by] || "top"
    @listings = []
    n = 0

    if sort == "top" || sort == "controversial"
        uri = URI('http://www.reddit.com/r/' + subreddit + '/' + sort + '/.json?limit=' + limit + '&t=' + time)
    else
        uri = URI('http://www.reddit.com/r/' + subreddit + '/' + sort + '/.json?limit=' + limit)
    end

    json = JSON.parse(Net::HTTP.get(uri))        #HTTP.get returns a string which is parsed to JSON
    
    limit.to_i.times do
      hash = json['data']['children'][n]['data']
      
      @listings[n] = { 
        
        title: hash['title'], 
        author: hash['author'], 
        num_comments: hash['num_comments'], 
        permalink: hash['permalink'], 
        likes: hash['likes'], 
        gilded: hash['gilded'], 
        stickied: hash['stickied'], 
        score: hash['score'],
        approved_by: hash['approved_by'],
        over_18: hash['over_18'],
        ups: hash['ups'],
        downs: hash['downs'],
        is_self: hash['is_self'],
        created: hash['created'],
        url: hash['url'],  
        distinguised: hash['distinguished'] 
      }

      n +=1
    end

    @listings
  end
end
