desc "Setup your fort board."
task :setup => :environment do
  if Admin.count >= 1
    puts "You have already created an admin."
    abort
  else
    puts "Enter admin password for your board:"
    pw = STDIN.gets
    Admin.create(:password => pw)
    puts "Admin created."
  end
end
