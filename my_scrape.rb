require "rubygems"
require "nokogiri"
require "open-uri"

PAGE_URL = "http://www.reddit.com/"
page = Nokogiri::HTML(open(PAGE_URL))
reddit_links = page.css("html body.listing-page.hot-page div.content div.spacer div#siteTable.sitetable.linklisting a.title")


File.open("my_scrape.html", "w") do |line|
	line.write("<!DOCTYPE html>\n")
	line.write("<html lang=\"en\">\n")
	line.write("<head>\n")
	line.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">\n")
	line.write("\t<title>Reddit 2.0</title>\n")
	line.write("</head>\n")
	####################################################################################
	####################################################################################
	####################################################################################
	line.write("<body>\n")
		line.write("<h1>A More Awesome Reddit</h1>")
		reddit_links.each do |link|
			line.write("<a href=\"#{link['href']}\">#{link.text}</a>\n")
			end
	####################################################################################
	####################################################################################
	####################################################################################
	line.write("</body>\n")
	line.write("</html>\n")
end
#inspect = reddit_links.each {|link| puts link}	
