class RedditNow::Posts
  attr_accessor :title, :upvote, :user, :url, :rank, :subreddit
  
  def self.now 
    self.scraped
  end
  
  def self.scraped
    frontpage = [] 
    
    frontpage << self.scraped_frontpage
    
    frontpage 
  end
  
  def self.scraped_frontpage
    list = []
    page = Nokogiri::HTML(open("https://old.reddit.com/r/all/", 'User-Agent' => 'Nooby'))
    
    posts = page.css("div[data-author]")
    posts.each do |op|
      new_post = self.new
      new_post.user = op.css("p.tagline").css("a").first.text
      new_post.subreddit = op.css("p.tagline").css("a")[1].text
      new_post.title = op.css("p.title").css("a").first.text
      new_post.rank = op.css("span.rank").first.text
      new_post.url = op.css("p.title").css("a").first.attr("href")
      new_post.upvote = op.css(".dislikes").first.text
  
      list << new_post
    end
    list
  end
  
  
end
