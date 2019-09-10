class RedditNow::Posts
  attr_accessor :title, :upvote, :user, :url, :rank, :subreddit
  
  def self.now 
    self.scraped
  end
  
  def self.scraped
    puts "1. 28.5k General from black panther I shall see - by gallowboob" #"#{i}. #{title} by #{user}"
    posts = [] 
    
    posts << self.scraped_frontpage
  end
  
  def self.scraped_frontpage
    list = []
    page = Nokogiri::HTML(open("https://old.reddit.com/r/all/", 'User-Agent' => 'Nooby'))
    posts = page.css("div#siteTable")
    cards = posts.css("div[data-author]")
    list << cards
    list
  end
  
  
end
