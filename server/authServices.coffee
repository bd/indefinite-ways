isAuthorized = () ->
		# note that at this point there is ever to be but one authorized user
		user = this.userId.trim() if this.userId
		authorized = Assets.getText('authorizedUsers').trim() if Assets.getText('authorizedUsers')
		user is authorized

Meteor.methods(
	isAuthorized : isAuthorized
	filePickerKey : () -> 
		if Meteor.call 'isAuthorized'
			Assets.getText('fpKey')
)