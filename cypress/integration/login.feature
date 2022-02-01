@feature-tag
Feature: Login Page

    Feature Page where the users can login to their accounts

    Rule: Succesfull

        Background:
            Given A user enters to the login page
        
        @automatable
        Scenario: Succes Login
            When A user enters the username "standard_user"
            And A user entersthe password "secret_sauce"
            And A user clicks on the login button
            Then A user will be logged in
        @Manual
        Scenario: Locked out User
            When A user enters the username "locked_out_user"
            And A user entersthe password "secret_sauce"
            And A user clicks on the login button
            Then The error message "Epic sadface: Sorry, this user has been locked out." is displayed
        @Pending
        Scenario: Failure User Login
            When A user enters incorrect credentials
                | username  | password     |
                | test-user | secret-sauce |
            And A user clicks on the login button
            Then The error message "Epic sadface: Username and password do not match any user in this service" is displayed
        @automatable
        Scenario: Failure Password Login
            When A user enters incorrect credentials
                | username  | password     |
                | standard_user | test-password |
            And A user clicks on the login button
            Then The error message "Epic sadface: Username and password do not match any user in this service" is displayed