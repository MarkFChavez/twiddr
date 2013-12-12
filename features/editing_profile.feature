Feature: Editing user profiles

	In order to edit your profile
	As a user
	You should be logged in

	Scenario: Navigating to edit profile when logged in
		Given there is a user:
			| name 				| email 				| password 				|
			| markchavez		| sampleuser@gmail.com 	| mysamplepassword 		|
		And I am logged in
		When I follow "Hi markchavez" link
		Then I should see "Edit Profile"
		And I should be on "/users/edit" page

	Scenario: Editing profile successfully
		Given there is a user:
			| name 				| email 				| password 				|
			| markchavez		| sampleuser@gmail.com 	| mysamplepassword 		|
		And I am logged in
		And I follow "Hi markchavez" link
		And I fill in "Name" with "markjoel"
		And I fill in "Current password" with "mysamplepassword"
		When I follow "Update" button
		Then I should see "Hi markjoel"
		But I should not see "Hi markchavez"

	Scenario: Editing profile without issuing your current password is invalid
		Given there is a user:
			| name 				| email 				| password 				|
			| markchavez		| sampleuser@gmail.com 	| mysamplepassword 		|
		And I am logged in
		And I follow "Hi markchavez" link
		And I fill in "Name" with "markjoel"
		When I follow "Update" button
		Then I should see "Current password can't be blank"
