class RedditNow::CLI

  def call
    puts "Here is Reddit's Current Frontpage"
    list_posts
    menu
  end
  
  def list_posts
    @posts = RedditNow::Posts.now
    
    @posts.each do |posted, i| 
      puts "#{posted.rank}. #{posted.upvote}: #{posted.title}".colorize(:blue)
      puts "    -submitted to #{posted.subreddit} by #{posted.user}".colorize(:light_blue)
      puts "------------------------------------------------".colorize(:yellow)
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
      elsif input.to_i > 0 && input.to_i < 25
        #Launchy.open("#{RedditNow::Posts.now[0][input.to_i-1].url}") #tried to make it open url in browser but might not work becuase of IDE Browser 
        #Launchy.open("#{@posts[0][input.to_i-1].url}")
        #system("start #{@posts[0][input.to_i-1].url}")
        the_post = @posts[input.to_i-1]
        puts "You Chose:".colorize(:red)
        puts "    #{the_post.rank}. #{the_post.upvote} upvotes: #{the_post.title}".colorize(:blue)
        puts "    -submitted to #{the_post.subreddit} by #{the_post.user}".colorize(:light_blue)
        puts "Here is the link:".colorize(:red)
        puts "    #{the_post.url}".colorize(:green)
      else
        puts "Invalid Command!".colorize(:magenta)
      end
    
    end
  end
  
end