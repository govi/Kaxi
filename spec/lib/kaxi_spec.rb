require 'spec_helper'



describe Kaxi do
	it "should return xcode project info" do
		project = Kaxi::Project.new
		project_file_path = File.absolute_path( File.join( 'spec', 'fixtures', 'TestXcodeProject.xcodeproj' ) )		
		project_info = project.xcode_project_info project_file_path
		project_info.should_not be_nil
		script = Kaxi::KaxiScript.new
		script.build_script_for project_info
	end


end