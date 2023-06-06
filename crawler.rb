# frozen_string_literal: true

require "fileutils"

t1 = Time.now
puts "Started at: #{t1}"

system("git clone https://github.com/ietf-tools/relaton-data-ieee")
FileUtils.rm_rf("data")
FileUtils.cp_r("relaton-data-ieee/data", ".")
FileUtils.rm_rf("relaton-data-ieee")

t2 = Time.now
puts "Stopped at: #{t2}"
puts "Done in: #{(t2 - t1).round} sec."
