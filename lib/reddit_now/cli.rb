class RedditNow::CLI

  def call
    puts "Here is Reddit's Current Frontpage"
    list_posts
    menu
  end
  
  def list_posts
    @posts = RedditNow::Posts.now
    
    @posts[0].each do |posted, i| 
      puts "#{posted.rank}. #{posted.upvote} Upvotes. #{posted.title} - submitted to #{posted.subreddit} by #{posted.user}"
    end
    
  end
  
  def menu
    input = nil
    while input != "exit"
    
      puts "Type post number to open post, list to view all posts, exit to exit"
      input = gets.strip.downcase
      
      if input == "list"
        list_posts
      elsif input == "exit"
        puts "See you next time!"
        break
      elsif input.to_i > 0
        system("open #{@posts[0][input.to_i-1].url}") 
      else
        puts "Invalid Command!"
      end
    
    end
  end
  
end
