require 'spec_helper'

module Kaxi
	describe Jenkins do 

		it "must capture the name of the new configuration" do
			jenkins = Jenkins.new			
			STDOUT.should_receive(:puts).with("Please enter a name for this Jenkins configuration [MyJenkins]")
			jenkins.stub!(:gets).and_return("MyJenkinsConf")
			jenkins.ask_for_name
			jenkins.jenkins_name.should == "MyJenkinsConf"
		end	

		it "must default to MyJenkins if the user doesnt specify the name of the new configuration" do
			jenkins = Jenkins.new			
			STDOUT.should_receive(:puts).with("Please enter a name for this Jenkins configuration [MyJenkins]")
			jenkins.stub!(:gets).and_return("\n")
			jenkins.ask_for_name
			jenkins.jenkins_name.should == "MyJenkins"
		end	

		it "must default to http://localhost:8080 if the user doesnt specify the url" do
			jenkins = Jenkins.new			
			STDOUT.should_receive(:puts).with("Please enter the URL of the Jenkins Server [http://localhost:8080]")
			jenkins.stub!(:gets).and_return("\n")
			jenkins.ask_for_url.should == true
			jenkins.jenkins_url.should == "http://localhost:8080"
		end

		it "must accept valid url" do
			jenkins = Jenkins.new			
			STDOUT.should_receive(:puts).with("Please enter the URL of the Jenkins Server [http://localhost:8080]")
			jenkins.stub!(:gets).and_return("http://192.168.0.1:9191/jenkins")
			jenkins.ask_for_url.should == true
			jenkins.jenkins_url.should == "http://192.168.0.1:9191/jenkins"
		end	

		it "must reject invalid url" do
			jenkins = Jenkins.new			
			STDOUT.should_receive(:puts).with("Please enter the URL of the Jenkins Server [http://localhost:8080]")
			jenkins.stub!(:gets).and_return("not an url")
			jenkins.ask_for_url.should == false
			jenkins.jenkins_url.should == nil
		end	

		it "must accepts authentication by default" do
			jenkins = Jenkins.new
			STDOUT.should_receive(:puts).with("Does the Jenkins server requires authentication? [Y/n]")
			jenkins.stub!(:gets).and_return("\n")
			jenkins.ask_if_it_requires_authentication.should == true
		end	

		it "must accepts authentication with 'y'" do
			jenkins = Jenkins.new
			STDOUT.should_receive(:puts).with("Does the Jenkins server requires authentication? [Y/n]")
			jenkins.stub!(:gets).and_return("y")
			jenkins.ask_if_it_requires_authentication.should == true
		end	

		it "must rejects authentication with 'N'" do
			jenkins = Jenkins.new
			STDOUT.should_receive(:puts).with("Does the Jenkins server requires authentication? [Y/n]")
			jenkins.stub!(:gets).and_return("N")
			jenkins.ask_if_it_requires_authentication.should == false
		end	

		it "must accept username" do
			jenkins = Jenkins.new
			STDOUT.should_receive(:puts).with("Enter username")
			jenkins.stub!(:gets).and_return("admin")
			jenkins.ask_username.should == true
			jenkins.jenkins_username.should == "admin"
		end

		it "must reject empty username" do
			jenkins = Jenkins.new
			STDOUT.should_receive(:puts).with("Enter username")
			jenkins.stub!(:gets).and_return("\n")
			jenkins.ask_username.should == false
			jenkins.jenkins_username.should == nil
		end	

		it "must accept password" do
			jenkins = Jenkins.new
			STDOUT.should_receive(:puts).with("Enter password")
			jenkins.stub!(:gets).and_return("password")
			jenkins.ask_password
			jenkins.jenkins_password.should == "password"
		end
	
	end
end