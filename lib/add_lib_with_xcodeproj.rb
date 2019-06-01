require 'xcodeproj'
require 'FileUtils'
# See: https://www.rubydoc.info/gems/xcodeproj/Xcodeproj
# Get project object
project_path = 'your_project_dir/Pods/Pods.xcodeproj'

project = Xcodeproj::Project.open(project_path)

lib_dir = "your_libs_dir/lib/Release";

# puts libRef
project.targets.each do |target|
    if target.name == "QYACG"
        # puts target.name
        # Get the build phase
        framework_buildphase = target.frameworks_build_phases
        # puts framework_buildphase
        # Add it to the build phase
        Dir[lib_dir + "/**/*.{a}"].each do |lib_path| 
            # Add the lib file as a reference
            libRef = project['Frameworks'].new_file(lib_path)
            file_ref = framework_buildphase.add_file_reference(libRef)
            # puts file_ref.pretty_print
        end
    end
end
# Save the project
project.save();