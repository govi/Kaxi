require 'xcodeproj/project'
require 'kaxi/kaxi_project'

module Kaxi

	class Project
		def xcode_project_info(xcode_project_path)
			puts "xcode_project_path #{xcode_project_path}"
			xcodeproj = Xcodeproj::Project.new xcode_project_path
			puts "targets #{xcodeproj.targets}"
			
			xcode_project_targets = Array.new
			xcodeproj.targets.each { |target| 
				xcode_target = Hash.new
				xcode_target['name'] = target.product_name

				puts "#{target.product_name} "
				target.build_phases.each { |phase|
					puts "phase -> #{phase}"
				}
				debug_settings = target.build_settings('Debug')
				puts "debug settings #{debug_settings}"
				xcode_project_targets.push xcode_target
			}
			
			xcode_project = KaxiProject.new
			xcode_project.targets = xcode_project_targets
			xcode_project.name = 'Test'
			xcode_project
		end	
	end	

end	