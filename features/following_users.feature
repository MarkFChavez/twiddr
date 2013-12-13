Feature: Following users

	In order to follow an awesome user
	As a user
	I should be able to follow a user on the search results page

	Scenario: Following a user you are not following yet
		Given there is a user:
			| name 				| email 				| password 				|
			| markchavez		| sampleuser@gmail.com 	| mysamplepassword 		|
		And I am logged in
		And there is a user:
			| name 				| email 				| password 				|
			| joelchavez		| joelchavez@gmail.com 	| mysamplepassword 		|
		And I reload the page "/dashboard"
		And I search for "joelchavez"
		When I follow "Follow" link
		Then I should see "You have successfully followed joelchavez" 

	Scenario: Following a user you have already followed
		Given there is a user:
			| name 				| email 				| password 				|
			| markchavez		| sampleuser@gmail.com 	| mysamplepassword 		|
		And I am logged in
		And there is a user:
			| name 				| email 				| password 				|
			| joelchavez		| joelchavez@gmail.com 	| mysamplepassword 		|
		And I reload the page "/dashboard"
		And I follow "joelchavez"
		And I go to "/dashboard" page
		When I search for "joelchavez"
		Then I should see "Following"