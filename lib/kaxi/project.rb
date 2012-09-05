require 'xcodeproj/project'
require 'kaxi/kaxi_project'
require 'kaxi/kaxi_script'

module Kaxi

	class Project

		def self.run
			puts "Generating Kaxi Rakefile in current directory."
			project = self.new
			current_directory = File.absolute_path( '.')
			xcode_project_path = project.find_xcodeproject_in_directory current_directory
			if not xcode_project_path
				raise "Run this command inside the same folder as your .xcodeproj file."				
			else				
				project_info = project.xcode_project_info xcode_project_path
				script = Kaxi::KaxiScript.new
				script.build_script_for( project_info, current_directory ) 	
			end
		end	

		def xcode_project_info(xcode_project_path)
			
			xcodeproj = Xcodeproj::Project.new xcode_project_path						
			xcode_project_targets = Array.new
			xcodeproj.targets.each { |target| 
				xcode_target = Hash.new
				xcode_target['name'] = target.product_name							
				debug_settings = target.build_settings('Debug')				
				xcode_project_targets.push xcode_target
			}
			
			xcode_project = KaxiProject.new
			xcode_project.targets = xcode_project_targets
			xcode_project.name = File.basename(xcode_project_path, '.xcodeproj')
			
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