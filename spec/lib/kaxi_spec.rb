require 'spec_helper'

describe Kaxi do
	it "should return xcode project info" do
		project_info = Kaxi.xcode_project_info 'path'
		project_info.should_not be_nil
	end
	
end