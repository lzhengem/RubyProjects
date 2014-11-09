#!/usr/local/bin/ruby
# Name: Lena Zheng
# File: generate.rb
# Desc: create a directory structure and files for a simple web application.

=begin 

This script create a directory structure and provides
some default files that we can use to create a working
CGI-style in a few minutes.

=Templates
This script uses some generic templates to create missing
files. 
=end

require 'fileutils'
include FileUtils
require 'find'

begin

#get the directory name from the user
dirnames = ARGV[0]


#these are the directories we will make within the given dirname
dirs = %w{ / app app/views app/views/layouts app/models app/controllers
	config db doc lib public public/javascripts public/stylesheets public/images log}


#make the directories and files
dirs.each do |makedir|
Dir.mkdir(File.join(Dir.getwd, dirnames, makedir), 0700)
puts "Creating #{File.join(dirnames, makedir)}"

	case makedir
	when "/" 
		File.open(File.join(Dir.getwd, dirnames, "index.cgi"), "w") {|f| f.write("this stuff will go into index.cgi")}
		puts "Creating #{File.join(dirnames, makedir, "index.cgi")}"
	when "lib"
		File.open(File.join(Dir.getwd, dirnames, makedir, "cgi_helper.rb"), "w") {|f| f.write("this stuff will go into cgi_helper")}
		puts "Creating #{File.join(dirnames, makedir, "cgi_helper")}"
	when "doc"
		File.open(File.join(Dir.getwd, dirnames, makedir, "README"), "w") {|f| f.write("this stuff will go into README")}
		puts "Creating #{File.join(dirnames, makedir, "README")}"
	end

end


DATA.each do |data|
	print (data + '!!! ')
end

rescue TypeError => e
	puts "You need to enter a directory name"
	puts e.message
end

# Usage message
# We run this script on the command line with the
# user providing the name of a directory
# Everything after __END__ is avalable in the DATA hash.

# DIRECTORY             FILE
# ---------             ----
__END__
/                       index.cgi README
app/
app/views/
app/views/layouts/
app/models/
app/controllers/
config/
db/
lib/                    cgi_helper.rb
public/             
public/javascripts/ 
public/stylesheets/ 
public/images/      
log/