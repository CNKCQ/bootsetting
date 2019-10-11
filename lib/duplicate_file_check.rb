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
        current_dir = Dir.pwd
        puts "🐈 #{current_dir}"
        fileNames = []
        files = Dir[current_dir + "/**/*.{#{suffix}}"]
        files.each do |old_dest| 
            fileNames.push(File.basename(old_dest))
        end
        fileMaps = Hash.new([])
        files.each { |filePath| 
            key = ""
            if type == "md5" 
                key = md5 = Digest::MD5.hexdigest(File.read(filePath))
            elsif type == "name"
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