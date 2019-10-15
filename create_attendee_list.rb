#!/usr/bin/env ruby

require 'pry'
require 'titleize'

attendees = []
File.open("name.csv", "r") do |f|
  f.each_line do |line|
    attendee = {}
    attendee[:email] = line.match(%r{(.*?)$})[1]
    attendee[:first_name]  = line.match(%r{^(.*?)\.})[1].titleize
    attendee[:last_name]  = line.match(%r{^(.*?)\.(.*?)\@})[2].titleize
    attendees << attendee
  end
end

Pry::ColorPrinter.pp(attendees)

puts "username,first name,last name,attendee email,attended,attendee company"
attendees.each do |attendee|
  puts "#{attendee[:email]},#{attendee[:first_name]},#{attendee[:last_name]},#{attendee[:email]},+,Liberty"
end