require 'FileUtils'
 
# specify files which should not be copied
dont_copy = ['.xcassets','.bundle']
ignore_path = ['Example/']
puts "Copying files from folder to dest folder"
from_dir = "./"
to_dir = "./build/Build/Products/Release-iphoneos/MusesSdk/include"

public_header_files_read_path = "./Example/Pods/Headers/Public/MusesSdk/**/*.{h}"
public_header_file_names = Array.new

Dir[public_header_files_read_path].each do |old_dest| 
	public_header_file_names.push(File.basename(old_dest))
end

def copy_with_path(src, dest)
  FileUtils.mkdir_p(File.dirname(dest))
  FileUtils.cp(src, dest)
end

Dir[from_dir + "/{MusesBaseConfig,MusesCapture,MusesEdit,MusesPublish,MusesResource,MusesStatistics}/**/*.{h}"].each do |old_dest| 
	new_dest = old_dest.gsub(from_dir,to_dir)
	should_path_ignore = ignore_path.any? { |s| new_dest.include?(s)}
	if should_path_ignore 
		next
	end
	should_copy = public_header_file_names.any? { |s| new_dest.include?(s)}
	if should_copy == false
		next
	end
	should_not_copy = dont_copy.any? { |s| new_dest.end_with?(s)}
	if !should_not_copy
		copy_with_path(old_dest, new_dest);
	else
		FileUtils.mkdir_p(File.dirname(new_dest))
		comd = "cp -R " + old_dest + " " + new_dest
		system(comd)
	end
end
