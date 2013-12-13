Feature: Searching other users

	In order to follow other users
	As a user of the application 
	I should be able to search them using the search bar provided on the navbar

	Background:
		Given there is a user:
			| name 				| email 				| password 				|
			| markchavez		| sampleuser@gmail.com 	| mysamplepassword 		|
		And I am logged in

	Scenario: Searching users that exist
		When there is a user:
			| name 					| email 						| password 				|
			| anotheruser			| anotheruser@gmail.com 		| mysamplepassword 		|
			| anotherepicuser		| anotherepicuser@gmail.com 	| mysamplepassword 		|
		And I reload the page "/dashboard"
		And I fill in "search" with "another"
		And I follow "Search" button
		Then I should see "anotheruser"
		And I should see "anotherepicuser"
		And I should see "2 results found"

	Scenario: Searching users that does not exist
		When there is a user:
			| name 					| email 						| password 				|
			| anotheruser			| anotheruser@gmail.com 		| mysamplepassword 		|
			| anotherepicuser		| anotherepicuser@gmail.com 	| mysamplepassword 		|
		And I reload the page "/dashboard"
		And I fill in "search" with "zzzzzzz"
		And I follow "Search" button
		Then I should not see "anotheruser"
		And I should not see "anotherepicuser"
		And I should see "0 results found"

	Scenario: Searching users by inputting empty text on search field	
		When there is a user:
			| name 					| email 						| password 				|
			| anotheruser			| anotheruser@gmail.com 		| mysamplepassword 		|
			| anotherepicuser		| anotherepicuser@gmail.com 	| mysamplepassword 		|
		And I reload the page "/dashboard"
		And I fill in "search" with ""
		And I follow "Search" button
		Then I should not see "anotheruser"
		And I should not see "anotherepicuser"
		And I should see "0 results found"