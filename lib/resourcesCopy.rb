
require 'FileUtils'

class CopyHelper  
	# desc "Copying files from acgn_ios_plugin to acgn_ios_plugin_pod folder"

	# desc "Instance"
	def initialize()  
	end  

	# desc "private copy"
	def copy_with_path(src, dest)
		FileUtils.mkdir_p(File.dirname(dest))
		FileUtils.cp(src, dest)
	end 

	# desc "public copy"
	def copy(from_dir, to_dir)
		# specify files which should not be copied
		dont_copy = ['.xcassets','.bundle']
		Dir[from_dir + "/**/*.{xib,storyboard,xcassets,bundle,jsbundle}"].each do |old_dest| 
			new_dest = old_dest.gsub(from_dir, to_dir)
			should_not_copy = dont_copy.any? { |s| new_dest.end_with?(s) }
			if !should_not_copy
				copy_with_path(old_dest, new_dest);
			else
				FileUtils.mkdir_p(File.dirname(new_dest))
				comd = "cp -R " + old_dest + " " + new_dest
				system(comd)
			end
		end
	end
end

