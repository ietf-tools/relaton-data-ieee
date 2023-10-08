# frozen_string_literal: true

require "fileutils"
require "relaton_ieee"

t1 = Time.now
puts "Started at: #{t1}"

token = ENV["token"]
puts token

system("git clone https://oauth2:#{token}@github.com/ietf-ribose/ieee-rawbib.git ieee-rawbib")
FileUtils.rm_rf("data")
RelatonIeee::DataFetcher.fetch
FileUtils.rm_rf("ieee-rawbib")

t2 = Time.now
puts "Stopped at: #{t2}"
puts "Done in: #{(t2 - t1).round} sec."
