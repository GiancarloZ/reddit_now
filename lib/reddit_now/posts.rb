class RedditNow::Posts
  attr_accessor :title, :upvote, :user, :url
  
  def self.now 
    puts "1. 28.5k General from black panther I shall see - by gallowboob" #"#{i}. #{title} by #{user}"
    
    post_1 = self.new 
    post_1.title = "General from black panther I shall see"
    post_1.upvote = "28.5k"
    post_1.user = "gallowboob"
    post_1.url = "https://i.redd.it/u3963s94xkl31.jpg"
    
    post_2 = self.new 
    post_2.title = "General from black panther I shall see"
    post_2.upvote = "28.5k"
    post_2.user = "gallowboob"
    post_2.url = "https://i.redd.it/u3963s94xkl31.jpg"
    
    [post_1, post_2]
  end
  
end
