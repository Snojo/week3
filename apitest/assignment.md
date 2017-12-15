## test-api.js

The cleanDatabase is sent through the messaging system through the messagerouter to the server. Where the message is recieved and the command is executed. The answer is return and sent back to here.

## user-api.js
### Assignment: Explain what the push/pop functions do for this API. What effect would it have on the fluent API if we did not have them?
It's to handle the asynchronous manner the push and pop messages are sent. Without it the users would recieve the messages out of order. 
It's a good way to handle asynchronous communication.

## tictactoe-game-player
### 1 
The code uses expects and asynchronosity to play both sides.

### 2
This didn't fail. I tried and tried and didn't fail. TA told us to skip it. 

## tictactoe.loadtest.js
The point here is to give the system enough room to work. We don't want to put the test right on the line of the max capacity. 
I make the system run a game 5 times in 1 second. This is because the Jenkins machine is quite slow and I'm afraid of what it can handle. 
My personal machine can manage around 25 per second. 

