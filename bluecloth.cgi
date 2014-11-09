#!/usr/local/bin/ruby
# Name: Lena Zheng
# File: bluecloth.cgi
#lab 5
# Date: 2014-10-27
# URL:  http://hills.ccsf.edu/~lzheng22/cs132a/bluecloth.cgi

ENV['GEM_HOME'] = '/students/lzheng22/mygems'
ENV['GEM_PATH']= '/students/lzheng22/mygems'
$:.unshift('.')
#require 'rubygems'
require 'bluecloth'
require 'open-uri'
print "Content-type: text/html","\n\n";

txt_url = "http://hills.ccsf.edu/~dputnam/markdown_example.markdown.txt"
markdown_text = open(txt_url, &:read)
markdown = BlueCloth.new(markdown_text)

puts markdown.to_html
