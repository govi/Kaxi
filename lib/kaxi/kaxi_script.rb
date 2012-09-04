require 'mustache'

module Kaxi
	
	class KaxiScript
		
		def build_script_for( xcode_project, script_directory )
			xcode_project.template_file = File.absolute_path( File.join( '.', 'lib', 'kaxi', 'kaxi_project.mustache' ) )		
			template_rendered = xcode_project.render
			puts "template rendered:\n#{template_rendered}"
			script_filename = File.absolute_path( File.join( script_directory, 'Rakefile' ) )		
			if File.exists?script_filename
				puts 'There is a Rakefile in the directory.'
			else
				File.new script_filename, 'w'
				File.open( script_filename, 'w'	) do |file|
					file.write template_rendered
					puts "Rake script created at #{script_filename}"
				end
			end	
		end	

	end	

end