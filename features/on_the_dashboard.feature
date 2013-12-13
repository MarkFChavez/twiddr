Feature: On the dashboard

	In order to start twiddring
	As a user
	I should be on the dashboard and I should see 
	some kind of button to start twidd'ing

	Scenario: Twidd'ing successfully
		Given there is a user:
			| name 				| email 				| password 				|
			| markchavez		| sampleuser@gmail.com 	| mysamplepassword 		|
		And I am logged in
		When I fill in "twidd_title" with "Hello, this is my first twidd!"
		And I follow "Twidd" button
		Then I should see "Hello, this is my first twidd!"
		And I should see "Twidd created successfully"

	Scenario: Twidd'ing without title will result in error
		Given there is a user:
			| name 				| email 				| password 				|
			| markchavez		| sampleuser@gmail.com 	| mysamplepassword 		|
		And I am logged in
		When I fill in "twidd_title" with ""
		And I follow "Twidd" button
		Then I should see "Title can't be blank"

	Scenario: Twidds should be in descending order starting from the newly created one
		Given there is a user:
			| name 				| email 				| password 				|
			| markchavez		| sampleuser@gmail.com 	| mysamplepassword 		|
		And I am logged in
		When the user created a twidd with a "twidd_title" of "sample twidd"
		And the user created a twidd with a "twidd_title" of "another sample twidd"
		And I reload the page "/dashboard"
		Then I should see the twidds in this order:
			| another sample twidd |
			| sample twidd 		   |

	Scenario: If there are no twidds available, there should be an informational message
		Given there is a user:
			| name 				| email 				| password 				|
			| markchavez		| sampleuser@gmail.com 	| mysamplepassword 		|
		When I am logged in
		Then I should see "No twidds available"

	Scenario: You should only see twidds twidded by the users you have followed
		Given there is a user:
			| name 				| email 				| password 				|
			| markchavez		| sampleuser@gmail.com 	| mysamplepassword 		|
		And the user created a twidd with a "twidd_title" of "my own twidd"
		And I am logged in
		And there is a user:
			| name 				| email 				| password 				|
			| userone			| userone@gmail.com 	| mysamplepassword 		|
		And the user created a twidd with a "twidd_title" of "another sample twidd for userone"
		And there is a user:
			| name 				| email 				| password 				|
			| usertwo			| usertwo@gmail.com 	| mysamplepassword 		|
		And the user created a twidd with a "twidd_title" of "another sample twidd for usertwo"
		And I reload the page "/dashboard"
		When I follow "userone"
		And I go to "/dashboard" page
		Then I should see "another sample twidd for userone"
		And I should see "my own twidd"
		But I should not see "another sample twidd for usertwo"

