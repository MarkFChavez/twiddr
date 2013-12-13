Feature: Deleting a twidd 

	In order to remove a twidd
	As a user
	I should be the owner of the twidd

	Scenario: Deleting a twidd you created
		Given there is a user:
			| name 				| email 				| password 				|
			| markchavez		| sampleuser@gmail.com 	| mysamplepassword 		|
		And the user created a twidd with a "twidd_title" of "sample twidd"
		And I am logged in
		When I follow "Remove twidd" link
		Then I should not see "sample twidd"
		And I should see "No twidds available"

	Scenario: Deleting a twidd you did not created
		Given there is a user:
			| name 				| email 				| password 				|
			| markchavez		| sampleuser@gmail.com 	| mysamplepassword 		|
		And the user created a twidd with a "twidd_title" of "sample twidd"
		And there is a user:
			| name 				| email 				| password 				|
			| erikchavez		| erikchavez@gmail.com 	| mysamplepassword 		|
		When I am logged in
		Then I should not see "Remove twidd"