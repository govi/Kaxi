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
			xcode_project.name = File.basename(xcode_project_path, '.xcodeproj')
			puts "project name #{xcode_project.name}"
			xcode_project
		end	

		def find_xcodeproject_in_directory( directory_path )
			dir = Dir.new directory_path
			file_xcodeproject = nil
			dir.each do |filename|				
				if File.extname(filename) == '.xcodeproj'
					file_xcodeproject = filename
				end
			end
			file_xcodeproject
		end	
	end	

end	