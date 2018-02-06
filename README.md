# driftrock

A solution to the Tech Test.

To access, simply git-clone it down and fire up app.rb

It has an interface that listens for the following exact commmands:

* most_sold: What is the name of the most sold item?
* total_spend [EMAIL]: What is the total spend of the user with this email address [EMAIL]? (e.g. $total_spend sjobs@apple.com)
* most_loyal: What is the email address of the most loyal user (most purchases)?

Test coverage is pretty good at almost 90%, but SimpleCov brings down test-coverage % due to trying to evaluate private methods too.

P.S. 10am on Tuesday (day after submitting test): reviewing it, I realised that since app.rb was injecting data from APIConnector, I no longer needed it in dataAnalyser (which was calling it in, back during development/testing). I had already removed dependency on it, to create a better structure (where App is an interface speaking to the two other classes, rather than reaching through to APIConnector through dataAnalyser). I did a quick commit just to wipe those out.

I also just realised, upon playing with it this morning, that I don't have a rescue condition for most_sold if dataAnalyser cannot find any purchases by an ID. I should have done a test for that. Since I've already submitted it, and it would require writing a new test and altering the code significantly, I won't change that now, but can discuss/demonstrate how I would do that.
