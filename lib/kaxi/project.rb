require 'xcodeproj/project'

module Kaxi

	class Project
		def xcode_project_info(xcode_project_path)
			puts "xcode_project_path #{xcode_project_path}"
			xcodeproj = Xcodeproj::Project.new xcode_project_path
			puts "targets #{xcodeproj.targets}"
			xcodeproj.targets.each { |target| 

				puts "#{target.product_name} "
				target.build_phases.each { |phase|
					puts "phase -> #{phase}"
				}
				debug_settings = target.build_settings('Debug')
				puts "debug settings #{debug_settings}"
			}
			xcodeproj
		end	
	end	

end	