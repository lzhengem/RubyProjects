#!/usr/local/bin/ruby
# Name: Lena Zheng
# File: lab4.cgi
# Date: 2014-10-14
# URL:  http://hills.ccsf.edu/~lzheng22/cs132a/lab4.cgi
#from the file /etc/group which contains all the information of each student in every class, extract out our class (74686) and display all the information
#of each student in our class in a table


# AT BEGINNING OF SCRIPT
t = Time.now
start = t.to_f

#access the cgi_helper file
$:.unshift File.dirname('./cgi_helper.cgi')

require 'cgi_helper.rb'
include CgiHelper
http_header


#create a class Student so we can make instances of each student in the class
class Student 
   attr_accessor :user_name, :password, :uid, :gid, :gcos_field, :home_directory, :shell
	attr_reader :count

	def initialize(data)
		@user_name,@password,@uid,@gid,@gcos_field,@home_directory,@shell = data
		if defined?(@@count)
			@@count +=1
		else
			@@count = 1
		end
	
		@count = @@count
	end

	def self.count
		@@count
	end
end

#looking at a specific class
our_class=[]
crn_number = '74686'
lines = File.readlines('/etc/group')
lines.each do |line|

#get an array of the people in our class
	string = line.to_s
	if string.include?(crn_number)
		our_class = string.split(/:|,/)
		our_class.slice!(0..2) 
	end
end


#get information about our class from the passwd file
get_info = File.readlines('/etc/passwd')

all_students = []
our_class.each do |student|
	@student = student
#find the line in /etc/passwd that belongs to each student

	get_info.each do |line|
		if line.include?(student)
			info = line.split(':')

			@student = Student.new(info)
			all_students << @student

		end
	end
end

#post the information about each student in a table
html=[]
fields = [:count, :user_name, :password, :uid, :gid, :gcos_field, :home_directory, :shell]
all_students.each do |student|
	html << '<tr>'

	fields.each do |f|
		if f == :gcos_field
			html << '<td>' + student.send(f).to_s + '</td>'
		else
  			html << '<td>' + student.send(f).to_s + '</td>'
  		end
	end

	html << '</tr>'
end

@html = html.join

puts render_file_with_erb('/students/lzheng22/public_html/cs132a/index.html.erb')

	
#how much time it took to finish
finish = Time.now
print 'Elapsed time: ' + (finish.to_f - start.to_f).to_s
