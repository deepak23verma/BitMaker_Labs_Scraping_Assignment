require "rubygems"
require "nokogiri"
require "open-uri"

PAGE_URL = "http://www.alternet.org/world"
page = Nokogiri::HTML(open(PAGE_URL))
word_news_links = page.css()

File.open("my_scrape.html", "w") do |line|
	line.write("<!DOCTYPE html>\n")
	line.write("<html lang=\"en\">\n")
	line.write("<head>\n")
	line.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">\n")
	line.write("\t<title>Web Scrape</title>\n")
	line.write("</head>\n")
	line.write("<body>\n")
	line.write("<h1> Deepak's Web Scrapes</h1>")
	line.write("<div>
		</div>")


	line.write("</body>\n")
end
