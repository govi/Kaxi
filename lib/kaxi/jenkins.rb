require 'uri'
require 'io/console'

module Kaxi
	class Jenkins
		
		attr_accessor :jenkins_name, :jenkins_url, :jenkins_username, :jenkins_password				

		def ask_for_jenkins_configuration			
			ask_for_name
			if ask_for_url
				if ask_if_it_requires_authentication
					if ask_username
						ask_password
					end		
				end	
			else
				puts 'Invalid URL'
			end	
								
		end	


		def ask_for_name
			puts "Please enter a name for this Jenkins configuration [MyJenkins]"
			@jenkins_name = gets.chomp
			if @jenkins_name == ''
				@jenkins_name = "MyJenkins"
			end
			true
		end

		def ask_for_url
			valid = true
			puts "Please enter the URL of the Jenkins Server [http://localhost:8080]"
			@jenkins_url = gets.chomp

			if @jenkins_url == ''
				@jenkins_url = "http://localhost:8080"
			elsif (@jenkins_url =~ URI::regexp).nil?				
				valid = false
				@jenkins_url = nil
			end
			valid
		end	

		def ask_if_it_requires_authentication
			requires = false
			puts "Does the Jenkins server requires authentication? [Y/n]"
			requires_input = gets.chomp
			if requires_input == '' or requires_input == 'Y' or requires_input == 'y'
				requires = true
			end
			requires	
		end	

		def ask_username
			valid = true
			puts "Enter username"
			@jenkins_username = gets.chomp
			if @jenkins_username == '' 
				valid = false
				@jenkins_username = nil
			end
			valid
		end
		
		def ask_password			
			puts "Enter password"
			@jenkins_password = STDIN.noecho(&:gets).chomp			
			
		end	
	end	
end