# driftrock

A solution to the Tech Test.

To access, simply git-clone it down and fire up app.rb

It has an interface that listens for the following exact commmands:

* most_sold: What is the name of the most sold item?
* total_spend [EMAIL]: What is the total spend of the user with this email address [EMAIL]? (e.g. $total_spend sjobs@apple.com)
* most_loyal: What is the email address of the most loyal user (most purchases)?

Test coverage is pretty good at almost 90%, but SimpleCov brings down test-coverage % due to trying to evaluate private methods too.
