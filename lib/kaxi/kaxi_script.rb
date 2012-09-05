require 'mustache'

module Kaxi
	
	class KaxiScript
		
		def self.template_path
			File.realpath( File.join(File.dirname(__FILE__),'kaxi_project.mustache') )      		
    	end

		def build_script_for( xcode_project, script_directory )
			xcode_project.template_file = KaxiScript.template_path
			template_rendered = xcode_project.render
			#puts "template rendered:\n#{template_rendered}"
			script_filename = File.absolute_path( File.join( script_directory, 'Rakefile' ) )		
			if File.exists?script_filename
				raise "A Rakefile already exists in this directory"
			else
				File.new script_filename, 'w'
				File.open( script_filename, 'w'	) do |file|
					file.write template_rendered
					puts  <<-eos
Rake script created at #{script_filename}
Execute 'rake -T' to see the list of tasks or 'rake' to compile the default target.
eos
				end
			end	
		end	

	end	

end