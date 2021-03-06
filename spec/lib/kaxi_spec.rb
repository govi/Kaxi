require 'spec_helper'

describe Kaxi do
	
	it "should find the xcodeproj file in the directory" do
		project = Kaxi::Project.new
		project_directory_path = File.absolute_path( File.join( 'spec', 'fixtures' ) )
		found_xcodeproj = project.find_xcodeproject_in_directory project_directory_path
		found_xcodeproj.should_not be_nil
		found_xcodeproj.should match 'TestXcodeProject.xcodeproj'

	end	

	it "should return xcode project info" do
		project = Kaxi::Project.new
		project_file_path = File.absolute_path( File.join( 'spec', 'fixtures', 'TestXcodeProject.xcodeproj' ) )		
		project_info = project.xcode_project_info project_file_path
		project_info.should_not be_nil		
		project_info.targets.should_not be_nil
	end

	it "should create Rakefile with Kaxi script" do
		project = Kaxi::Project.new
		project_file_path = File.absolute_path( File.join( 'spec', 'fixtures', 'TestXcodeProject.xcodeproj' ) )		
		project_info = project.xcode_project_info project_file_path		
		script = Kaxi::KaxiScript.new
		script.build_script_for( project_info, File.absolute_path( File.join( 'spec', 'fixtures' ) ) )	
		expected_rakefile_path = File.absolute_path( File.join( 'spec', 'fixtures', 'Rakefile' ) )		
		File.exists?(expected_rakefile_path).should be_true
		File.delete expected_rakefile_path
	end	

end