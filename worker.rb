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
  `#{args[:command]}`
end

Stalker.work
