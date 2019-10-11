require "bootsetting/version"
require "resourcesCopy"
require "duplicate_file_check"
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
  # duplicate file check
  desc "type", "suffix of each file"
  def dfc(type, suffix)
      puts "start to check ...".bright.red
      helper = FileCheckHelper.new()
      helper.check(type, suffix)
  end

  desc "UserKeyMapping", "say hello to new keyMapping"
  def kswitch()
		`hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E0},{"HIDKeyboardModifierMappingSrc":0x7000000E0,"HIDKeyboardModifierMappingDst":0x700000039}]}'`
		puts "say hello to new keyMapping".bright.green
  end

  desc "Copy resourses from", "another specific dir"
  def copy(from_dir, to_dir)
      puts "form: #{from_dir} to: #{to_dir}".bright.red
      helper = CopyHelper.new()  
      helper.copy(from_dir, to_dir)
  end

end

CLI.start(ARGV)
exit
end

# Thor See: http://whatisthor.com/
