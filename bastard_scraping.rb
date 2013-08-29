require "rubygems"
require "nokogiri"
require "open-uri"
PAGE_URL = "http://ruby.bastardsbook.com/files/hello-webpage.html"

page = Nokogiri::HTML(open(PAGE_URL))

puts "####SELECTING HTML ELEMENTS######"
puts page.css("title")[0].name #==> title
puts page.css("title")[0].text #==> My webpage
puts ""

puts "####SELECTING ATTRIBUTES OF ELEMENTS####"
links = page.css("a")
puts links.length #==> 6
puts links[0].text #==> Click Here
puts links[0]["href"] #==> http://google.com
puts ""

puts "#####LIMITING WHAT IS SELECTED#####"
news_links = page.css("a")
news_links = news_links.select {|link| link['data-category'] == "news"}
news_links.each {|link| puts "#{link.text}: #{link['href']}"}
puts news_links.class
puts ""

puts "######SELECTING ELEMENTS BY ATTRIBUTES#####"
news_links = page.css("a[data-category=news]")
news_links.each {|link| puts "#{link.text}: #{link['href']}"}
puts news_links.class
puts ""

puts "#####CALLING CSS METHODS MULTIPLE TIMES TO NARROW DOWN THE RESULTS#####"
page.css('p').css('a[data-category=news]').css('strong')
page.css('p a strong') #==> bundling the elements path together works as well
puts ""

puts "#####USING CSS CLASS AND IDS TO SELECT ELEMENTS#####"
reference_links = page.css('div#references a')
puts "Reference Links:"
reference_links.each {|link| puts "#{link.text}: #{link['href']}"}

puts "-------------"

puts "Fun Stuff Links"
funstuff_links = page.css('div#funstuff a')
funstuff_links.each {|link| puts "#{link.text}: #{link['href']}"}
puts ""