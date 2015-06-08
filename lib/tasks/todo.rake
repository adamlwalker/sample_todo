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
end
