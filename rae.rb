#!/usr/local/bin/ruby

require 'watir-webdriver'


STDOUT.flush  
word = gets.chomp.downcase

b = Watir::Browser.new
b.goto 'http://lema.rae.es/drae/srv/search?val='+word

definitions = b.spans(:class, 'b').map do |definition|
	definition.text
end

definitions.empty?
	puts 'No definitions were found.'

puts definitions

b.close