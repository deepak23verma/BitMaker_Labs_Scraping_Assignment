# encoding: utf-8

require 'rubygems'
# require 'array'
# require "math"
require 'nokogiri'
require 'open-uri'

page_craigslist = "http://toronto.en.craigslist.ca/search/?areaID=25&subAreaID=&query=macbook+pro&catAbb=sss"
page = Nokogiri::HTML(open(page_craigslist))
links = page.css("a")
puts links["href"]

# File.open('macbook.html', 'w') do |f|
# 	puts links["href"]
# 	books = page.css('table tr td:first­child span')

# 	books.each do |book|
# 		f.write(“<div>” + book + "</div>\n")
# 	end