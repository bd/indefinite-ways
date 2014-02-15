isAuthorized = () ->
		# note that at this point there is ever to be but one authorized user
		user = if this.userId then this.userId.trim() else "NOT AUTHORIZED"
		# console.log "user: " + user
		authorized = Assets.getText('authorizedUsers') if Assets.getText('authorizedUsers')
		# console.log "Index of userID = " + authorized.indexOf user
		# console.log "to return: "  +  authorized.indexOf(user.trim()) > -1
		authorized.indexOf(user.trim()) > -1

Meteor.methods(
	isAuthorized : isAuthorized
	filePickerKey : () -> 
		if Meteor.call 'isAuthorized'
			Assets.getText('fpKey')
)