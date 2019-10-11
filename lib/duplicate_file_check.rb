require 'FileUtils'
require 'digest/md5'

class FileCheckHelper  
	# desc "Copying files from acgn_ios_plugin to acgn_ios_plugin_pod folder"

	# desc "Instance"
	def initialize()  
	end  

	# duplicate file check
	def check(type, suffix)
		# specify files which should not be copied
        super_dir = File.expand_path('../', __FILE__)
        puts "🐈 #{super_dir}"
        fileNames = []
        files = Dir[super_dir + "/**/*.{#{suffix}}"]
        files.each do |old_dest| 
            fileNames.push(File.basename(old_dest))
        end
        fileMaps = Hash.new([])
        files.each { |filePath| 
            puts "🌹check type: #{type} suffix: #{suffix}"
            key = ""
            if type == "md5" 
                puts "check type: #{type} suffix: #{suffix}"
                key = md5 = Digest::MD5.hexdigest(File.read(filePath))
            elsif type == "name"
                puts "check type: #{type} suffix: #{suffix}"
                key = File.basename(filePath)
            end
            fileArr = [] + fileMaps[key] 
            fileMaps[key] = fileArr.push(filePath)
        } 
        fileMaps.each {|key, value|
            if value.count > 1
                puts "#{key} repeat count: #{value.count}"
                fileArr = [] + value
                fileArr.each { |filePath|
                    puts "#{filePath}"
                }
            end
        }
	end
end