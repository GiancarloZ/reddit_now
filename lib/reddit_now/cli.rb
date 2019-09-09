class RedditNow::CLI

  def call
    puts "Here is Reddit's Current Frontpage"
    list_posts
    menu
  end
  
  def list_posts
    @posts = RedditNow::Posts.now
  end
  
  def menu
    input = nil
    while input != "exit"
    
      puts "Type post number to open post, list to view all posts, exit to exit"
      input = gets.strip.downcase
      case input
      when "list"
        list_posts
      when "exit"
        puts "See you next time!"
        break
      #else
        #system("open #{@newsletter.articles[input.to_i-1].url}") 
      end
    
    end
  end
  
end
