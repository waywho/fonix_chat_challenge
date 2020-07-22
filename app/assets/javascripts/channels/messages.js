App.messages = App.cable.subscriptions.create('MessagesChannel', {  
	connected: function() {
		console.log("connected to Message Channel")
	},
  received: function(data) {
  	console.log("message", data)
  }
});