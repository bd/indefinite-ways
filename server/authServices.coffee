isAuthorized = () ->
		# note that at this point there is ever to be but one authorized user
		user = this.userId.trim() if this.userId
		authorized = Assets.getText('authorizedUsers').trim() if Assets.getText('authorizedUsers')
		#console.log "Index of userID = " + authorized.indexOf user
		authorized.indexOf user >= 0

Meteor.methods(
	isAuthorized : isAuthorized
	filePickerKey : () -> 
		if Meteor.call 'isAuthorized'
			Assets.getText('fpKey')
)