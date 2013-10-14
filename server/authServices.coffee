

Meteor.methods(
	isAuthorized : (user) ->
		# console.log Assets.getText('authorizedUsers') 
		# console.log this.userId.replace('\w', '')
		this.userId == Assets.getText('authorizedUsers')
)