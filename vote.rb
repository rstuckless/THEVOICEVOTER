#!/usr/bin/env ruby
#############################################
# Put in whatever emails you want down below
# => Dependencies:
# =>      - watir-webdriver
#
#############################################

require 'watir-webdriver'
emails = ['randyst1991+110@gmail.com',
		  'randyst1991+210@gmail.com',
		  'randyst1991+310@gmail.com',
		  'randyst1991+410@gmail.com']

emails.each do |email|
	b = Watir::Browser.new :chrome
	b.goto 'http://thevoicevote.votenow.tv/'
	sleep 2
	b.image(:alt, "Joshua Davis").click
	b.text_field(:id, "email").set email
	b.select(:id, "DOB_MM").select 10
	b.select(:id, "DOB_DD").select 11
	b.select(:id, "DOB_YYYY").select 1981
	b.input(:id, "emailAuthOptin").click
	b.input(:id, "submitEmailAuth").click
	10.times{ b.button(:class, /allocate-more/).click
	sleep (1.0/4.0)}
	b.button(:id, "voteSubmit").click
	b.button(:class, /cast-all-votes/).click
	sleep 1
	b.quit
end
