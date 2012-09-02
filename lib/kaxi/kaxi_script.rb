require 'mustache'

module Kaxi
	
	class KaxiScript

		

		def build_script_for( xcode_project )
			xcode_project.template_file = File.absolute_path( File.join( '.', 'lib', 'kaxi', 'kaxi_project.mustache' ) )

			
			template_rendered = xcode_project.render
			puts "template rendered:\n#{template_rendered}"
		end	

	end	

end