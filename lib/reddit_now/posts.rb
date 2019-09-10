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
    posts = page.css("div[data-author]")
    binding.pry
    user = posts.css("p.tagline").css("a").first.text
    subreddit = posts.css("p.tagline").css("a")[1].text
    title = posts.css("p.title").css("a").first.text
    rank = posts.css("span.rank").first.text
    url = posts.css("p.title").css("a").first.attr("href")
    upvote = posts.css(".dislikes").first.text
    
  end
  
  
end
