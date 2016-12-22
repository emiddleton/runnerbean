require 'optparse'
require 'stalker'
include Stalker

options = {}
OptionParser.new do |parser|
  parser.on("-q", "--queue NAME", String, "The queue to listen on") do |v|
    options[:queue] = v
  end
end.parse!
puts options.inspect
job options[:queue] do |args|
  puts "runner #{args[:command]}"
  puts `#{args[:command]}`
end

Stalker.work
