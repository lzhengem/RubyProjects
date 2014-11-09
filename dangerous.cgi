#!/usr/local/bin/ruby
# Name: Lena Zheng
# File: dangerous.cgi
#lab 5
# Date: 2014-10-27
# URL:  http://hills.ccsf.edu/~lzheng22/cs132a/dangerous.cgi

#!/usr/local/bin/ruby

require 'cgi'

cgi = CGI.new


your_text = ''
empty_submission = nil

#
# cgi.params has all of the GET and POST variables
#
if cgi.params['your_text'].empty? or cgi.params['your_text'][0] == ''
   output = "<div class='alert alert-info'>Please enter some text</div>" 
else
   if cgi.params['your_text'][0] =~ /script/i
        puts "Location: http://apple.com"
        puts
        exit
   end
   your_text =  CGI.escapeHTML(cgi.params['your_text'][0])
   empty_submission=true
end

puts 'Content-type:text/html'
puts

puts <<FORM
<!doctype html>
<head>
    <meta charset="utf-8">
    <title>Form</title>
    <link rel="stylesheet" href="/~dputnam/assets/stylesheets/bootstrap.min.css">
</head>
<div class="container">
<div class="row">
    <div class="col-md-8 col-md-2-offset">
   <h2>Dangerous or Harmless?</h2>

   #{output}
    <p> 
   <form action="" method="post">
      Enter some text: <br><input type="text" name="your_text" value="#{your_text}">
      <input type="submit" name="submit" value='Check it out >'>
   </form>
    </p> 
FORM

def code_is_safe?(code)
	code =~ /[-`;*'"]/ ? false : true
end

if your_text == ''

elsif code_is_safe?(your_text)
	puts "<h1><font color = 'green'><b>Harmless: </b></font></h1><br>"
	puts your_text
else 
	puts "<h1><font color = 'red'><b>Beware, dangerous! </b></font></h1><br>"
end

