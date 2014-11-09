#used for getclassinfo.cgi
#defines ways to convert file to erb

module CgiHelper
  require 'cgi'
  # renders a file using ERB and render_erb
  def render_file_with_erb(file)
    rhtml = File.read(file)
    unless rhtml.nil?
      render_erb(rhtml)
    else
      raise "Could not open " + file
    end
  end

  # renders a string using ERB
  def render_erb(rhtml)
    require 'erb'
    erb = ERB.new(rhtml)
    erb.result(binding)
  end


  def h(html) 
    CGI::escapeHTML(html) 
  end 

#includes a http_header
  def http_header
    print "Content-type: text/html","\n\n";

  end

end

