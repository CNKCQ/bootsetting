require "bootsetting/version"

module Bootsetting
  # Your code goes here...
  puts 'Hello gem, you are best beauty, maybe something has change'
  `hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E0},{"HIDKeyboardModifierMappingSrc":0x7000000E0,"HIDKeyboardModifierMappingDst":0x700000039}]}'`
  exit
end
