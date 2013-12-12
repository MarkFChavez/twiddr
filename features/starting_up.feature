Feature: Using the twiddr application

	In order to start using the twiddr application
	As a user
	I should sign up first

	After signing up, I should sign in via the homepage

	Scenario: Signing up successfully
		Given I am on the homepage
		When I follow "Sign up" link
		And I fill in "Name" with "mrkjlchvz"
		And I fill in "Email" with "markchav3z@gmail.com"
		And I fill in "Password" with "myaccountpassword"
		And I fill in "Password confirmation" with "myaccountpassword"
		And I follow "Sign up" button
		Then I should see "You have signed up successfully"

	Scenario: Signing up by not providing a name will result in error
		Given I am on the homepage
		When I follow "Sign up" link
		And I fill in "Name" with ""
		And I fill in "Email" with "markchav3z@gmail.com"
		And I fill in "Password" with "myaccountpassword"
		And I fill in "Password confirmation" with "myaccountpassword"
		And I follow "Sign up" button
		Then I should see "Name can't be blank"

	Scenario: Signing up by not providing a correct value for password confirmation
		Given I am on the homepage
		When I follow "Sign up" link
		And I fill in "Name" with "mrkjlchvz"
		And I fill in "Email" with "markchav3z@gmail.com"
		And I fill in "Password" with "myaccountpassword"
		And I fill in "Password confirmation" with "thisisnotcorrectpassword"
		And I follow "Sign up" button
		Then I should see "Password doesn't match"

	Scenario: Signing up with invalid email
		Given I am on the homepage
		When I follow "Sign up" link
		And I fill in "Name" with "mrkjlchvz"
		And I fill in "Email" with "markchav3zgmail"
		And I fill in "Password" with "myaccountpassword"
		And I fill in "Password confirmation" with "myaccountpassword"
		And I follow "Sign up" button
		Then I should see "Email is invalid"

	Scenario: Logging in with valid credentials
		Given there is a user:
			| name 				| email 				| password 				|
			| markchavez		| sampleuser@gmail.com 	| mysamplepassword 		|
		And I am on the homepage
		When I follow "Login" link
		And I fill in "Email" with "sampleuser@gmail.com"
		And I fill in "Password" with "mysamplepassword"
		And I follow "Sign in" button
		Then I should see "Signed in successfully"
		And I should see "Hi markchavez!"
		And I should see "Dashboard"
		But I should not see "Login"
		And I should not see "Sign up"

	Scenario: Logging in with invalid credentials
		Given there is a user:
			| name 				| email 				| password 				|
			| markchavez		| sampleuser@gmail.com 	| mysamplepassword 		|
		And I am on the homepage
		When I follow "Login" link
		And I fill in "Email" with "wronguser@gmail.com"
		And I fill in "Password" with "mysamplepassword"
		And I follow "Sign in" button
		Then I should see "Invalid email or password."

	Scenario: Signing out
		Given there is a user:
			| name 				| email 				| password 				|
			| markchavez		| sampleuser@gmail.com 	| mysamplepassword 		|
		And I am logged in
		When I follow "Logout" link
		Then I should see "Signed out successfully"
		And I should see "Login"
		And I should see "Sign up"
		But I should not see "Hi markchavez!"

	Scenario: Going to dashboard page without logging in
		Given I am on the homepage
		When I go to "/dashboard" page
		Then I should see "You need to sign in or sign up before continuing"
		



