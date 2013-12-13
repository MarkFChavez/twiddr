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

Given(/^I search for "(.*?)"$/) do |text|
  fill_in "search", with: text
  click_button "Search"
end

Given(/^I follow "(.*?)"$/) do |text|
  fill_in "search", with: text
  click_button "Search"
  click_link "Follow"
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

When(/^I go to "(.*?)" page$/) do |link|
  visit link
end

When(/^the user created a twidd with a "(.*?)" of "(.*?)"$/) do |field, value|
  @twidd = @user.twidds.create!(title: value)
end

When(/^I reload the page "(.*?)"$/) do |page|
  visit page
end

Then(/^I should see the twidds in this order:$/) do |table|
  expected_order = table.raw
  actual_order = page.all('.twidd blockquote p.lead').collect(&:text)

  actual_order.should == expected_order.flatten
end

Then(/^I should see "(.*?)"$/) do |text|
	page.should have_content(text)
end

Then(/^I should not see "(.*?)"$/) do |text|
 	page.should_not have_content(text)
end

Then(/^I should be on "(.*?)" page$/) do |page|
	current_path.should == page
end