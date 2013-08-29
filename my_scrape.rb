require "rubygems"
require "nokogiri"
require "open-uri"

PAGE_URL = "http://www.reddit.com/"
page = Nokogiri::HTML(open(PAGE_URL))
reddit_links = page.css("html body.listing-page.hot-page div.content div.spacer div#siteTable.sitetable.linklisting a.title")


File.open("my_scrape.html", "w") do |line|
	line.puts("<!DOCTYPE html>")
	line.puts("<html lang=\"en\">")
	line.puts("<head>")
	line.puts("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"reset.css\">")
	line.puts("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">")
	line.puts("<link href=\'http://fonts.googleapis.com/css?family=Carrois+Gothic\' rel=\'stylesheet' type=\'text/css\'>")
	line.puts("\t<title>Reddit 2.0</title>")
	line.puts("</head>")
	####################################################################################
	####################################################################################
	####################################################################################
	line.puts("<body>")
		line.puts("<div id=\"container\">")
			line.puts("<div id=\"header\">")
				line.puts("<h1>A More Awesome Reddit</h1>")
			line.puts("</div>") #closing header div
			line.puts("<div id=\"headline\">")
				line.puts("<a href=\"#{reddit_links[0]['href']}\">#{reddit_links[0].text}</a>")
			line.puts("</div>") #close headline div
			line.puts("<div class=\"secondary\">")
				line.puts("<div class=\"second_row_news\">")
					line.puts("something1")
				line.puts("</div>") #close second_row_news div
				line.puts("<div class=\"second_row_news\">")
					line.puts("something2")
				line.puts("</div>") #close second_row_news div
				line.puts("<div class=\"second_row_news\">")
					line.puts("something3")
				line.puts("</div>") #close second_row_news div
			line.puts("</div>") #close secondary div
		# reddit_links.each do |link|
		# 	line.puts("<a href=\"#{link['href']}\">#{link.text}</a>")
		# 	end
	####################################################################################
	####################################################################################
	####################################################################################
		
	line.puts("</div>") #closing container div
	line.puts("</body>")
	line.puts("</html>")
end
#inspect = reddit_links.each {|link| puts link}	
