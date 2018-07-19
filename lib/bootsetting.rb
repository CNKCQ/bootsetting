require "bootsetting/version"
require 'rainbow/refinement'
require "thor"
using Rainbow

module Bootsetting
  # Your code goes here...
class CLI < Thor
  # contents of the Thor class
  desc "hello NAME", "say hello to NAME"
  def hello(name, from=nil)
    puts "from: #{from}" if from
    puts "Hello method #{name}".bright.red
  end

  desc "UserKeyMapping", "say hello to new keyMapping"
  def kswitch()
		`hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E0},{"HIDKeyboardModifierMappingSrc":0x7000000E0,"HIDKeyboardModifierMappingDst":0x700000039}]}'`
		puts "say hello to new keyMapping".bright.green
  end
end

CLI.start(ARGV)
exit
end

# Thor See: http://whatisthor.com/
