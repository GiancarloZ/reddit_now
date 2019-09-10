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
        #Launchy.open("#{RedditNow::Posts.now[0][input.to_i-1].url}") #tried to make it open url in browser but might not work becuase of IDE Browser 
        #Launchy.open("#{@posts[0][input.to_i-1].url}")
        #system("start #{@posts[0][input.to_i-1].url}")
        the_post = @posts[0][input.to_i-1]
        puts "You Chose:"
        puts "#{the_post.rank}. #{the_post.upvote} Upvotes. #{the_post.title} - submitted to #{the_post.subreddit} by #{the_post.user}"
        puts "Here is the link: #{the_post.url}"
      else
        puts "Invalid Command!"
      end
    
    end
  end
  
end
