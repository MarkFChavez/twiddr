Given(/^I am on the homepage$/) do
  visit root_path
end

Given(/^there is a user:$/) do |table|
  table.hashes.each do |attributes|
  	@user = FactoryGirl.create(:user, attributes)
  end
end

Given(/^I am logged in$/) do 
  visit new_user_session_path
  fill_in "Email", with: @user.email 
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
	fill_in field, with: value
end

When(/^I follow "(.*?)" (link|button)$/) do |text, target|
	if target == "link"
		click_link text 
	else 
		click_button text 
	end
end

Then(/^I should see "(.*?)"$/) do |text|
	page.should have_content(text)
end

Then(/^I should not see "(.*?)"$/) do |text|
 	page.should_not have_content(text)
end