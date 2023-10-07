# frozen_string_literal: true

require "fileutils"

t1 = Time.now
puts "Started at: #{t1}"

puts ENV.length
token = ENV[0]
system("git clone https://oauth2:#{token}@github.com/ietf-ribose/ieee-rawbib.git ieee-rawbib")
require "relaton_ieee"
FileUtils.rm_rf("data")
RelatonIeee::DataFetcher.fetch

FileUtils.rm_rf("ieee-rawbib")

t2 = Time.now
puts "Stopped at: #{t2}"
puts "Done in: #{(t2 - t1).round} sec."
