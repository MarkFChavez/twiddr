require 'spec_helper'

describe Twidd do 
	context "validations" do 
		context "title" do 
			it "should be required" do 
				twidd = FactoryGirl.build(:twidd, title:"")
				twidd.should_not be_valid
			end

			it "should not be more than 140 characters" do 
				twidd = FactoryGirl.build(:twidd, title:"a"*141)
				twidd.should_not be_valid
			end
		end
	end

	context "associations" do 
		it { should belong_to(:user) }
	end
end