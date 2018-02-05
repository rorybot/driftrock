# driftrock

A solution to the Tech Test. 

To access, simply git-clone it down and fire up app.rb

It has an interface that listens for the following exact commmands:

* most_sold: What is the name of the most sold item?
* total_spend [EMAIL]: What is the total spend of the user with this email address [EMAIL]? (e.g. $total_spend sjobs@apple.com)
* most_loyal: What is the email address of the most loyal user (most purchases)?

Test coverage is ok, but is brought down by the untested command line UI. I was trying to get a test working for STDIN to STDOUT, but I couldn't figure out a way to get it to expect a certain STDOUT when a certain STDIN is given. I tried various solutions but none were working, and it ended up taking up too much of the available time. SimpleCov also brings down test-coverage % due to trying to evaluate private methods too.
