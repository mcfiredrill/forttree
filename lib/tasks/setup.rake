desc "Setup your fort board."
task :setup => :environment do
  puts "Enter admin password for your board:"
  pw = STDIN.gets
  Admin.create(:password => pw)
  puts "Admin created."
end
