namespace :todo do
  desc "list projects and TODO"
  task show: :environment do
  Project.all.find_each do |project|
   puts project.title
     Item.where(:project_id => project.id).where(cleared: nil).find_each do |item|
       item.done ? (puts "- [X] #{item.action}") : (puts "- [ ]  #{item.action}")
     end
  end
  end

  desc "purge all soft deleted items"
  task clear: :environment do
  	def clear_items
  	  items = Item.where(:cleared => true).count
  	  if items == 0
  	    puts "Nothing to clear"
  	    return
  	   end
  	 print "Delete #{items} item(s) [Y/n]: "
     choice = STDIN.gets
     if choice.downcase.strip != "n"
      Item.where(:cleared => true).destroy_all
      puts "#{items} cleared"
     else
     	puts "Rake aborted"
     end
  end

clear_items
end
end
