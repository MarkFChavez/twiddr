require 'spec_helper'

describe User do
  context "validation" do 
  	before(:each) do 
  		@attributes = {
  			name: "markjoelchavez",
  			email: "markchav3z@gmail.com",
  			password: "mysamplepassword",
  			password_confirmation: "mysamplepassword"
  		}
  	end

  	context "name" do 
  		it "should have a name" do 
  			user = User.new(@attributes.merge(name:""))
  			user.should_not be_valid
  		end
  	end

  	context "email" do 
  		it "should have an email" do 
  			user = User.new(@attributes.merge(email:""))
  			user.should_not be_valid 
  		end

  		it "should be in a valid format" do 
  			user = User.new(@attributes.merge(email:"invalidemailformat"))
  			user.should_not be_valid
  		end
  	end

  	context "passwords" do 
  		it "should have a password" do 
  			user = User.new(@attributes)
  			user.password = ""
  			user.should_not be_valid
  		end

  		it "should match the confirmation password field" do 
  			user = User.new(@attributes.merge(password:"originalpassword", password_confirmation:"notmatchingthepassword"))
  			user.should_not be_valid
  		end
  	end
  end

  context "associations" do 
    it { should have_many(:twidds).dependent(:destroy) }
  end
end
