# Copyright @2016 by Tom Hockett

# This simple program logs a user into their gmail account,
# creates a mail object, and iterates over the messages to mark
# all new messages as 'read.'

require 'gmail'
require 'io/console'

def read_me(username, password)
  gmail = Gmail.connect(username, password)

  puts "You have #{gmail.inbox.count(:unread)} unread messages!"
  puts "Would you like to mark all messages as 'read?' (messages will NOT be deleted)"
  print "[y/n]: "
  input = $stdin.gets.chomp

  if input == 'y'
    puts "This might take some time . . . ."
    gmail.inbox.find(:unread).each { |e| e.read! }
    puts "Done! You have #{gmail.inbox.count} messages, of which #{gmail.inbox.count(:unread)} are unread!"
    gmail.logout
  elsif input == 'n'
    puts "No problem. You have #{gmail.inbox.count} messages, of which #{gmail.inbox.count(:unread)} are unread."
    gmail.logout
  else
    puts "Please type the appropriate response."
    read_me(username, password)
  end
end

print "Please enter your email: "
username = $stdin.gets.chomp

print "Please enter your password: "
password = $stdin.noecho(&:gets).chomp
puts

read_me(username, password)
