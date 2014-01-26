desc "Email to ask users what they're feedback"
task :friends => :environment do
  User.all.each do |u|
    UserMailer.get_friends(u).deliver
  end
end