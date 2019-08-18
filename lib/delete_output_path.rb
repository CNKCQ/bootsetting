require 'xcodeproj'
require 'FileUtils'
# See: https://www.rubydoc.info/gems/xcodeproj/Xcodeproj
# Get project object

super_dir = File.expand_path('../../', __FILE__)
project_path = "#{super_dir}/qiyivideo2/QiYiVideo.xcodeproj"
puts project_path
project = Xcodeproj::Project.open(project_path)
# 删除多余的 output_path
project.targets.each do |target|
    if target.name == "QiYiVideo"
        puts target.name
        # Get the build phase
        shell_script_build_phases = target.shell_script_build_phases
        shell_script_build_phases.each do |shellScriptBuildPhase|
            if shellScriptBuildPhase.name == "[CP] Copy Pods Resources"
                puts shellScriptBuildPhase.name
                output_paths = shellScriptBuildPhase.output_paths
                puts output_paths
                output_paths.each do |output_path|
                    puts output_path
                    if output_path.include? "Assets.car" 
                        output_paths.delete(output_path)
                    end
                end
                shellScriptBuildPhase.output_paths = output_paths
            end
        end
    end
end
# Save the project
project.save();