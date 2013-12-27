isAuthorized = () ->
		# note that at this point there is ever to be but one authorized user
		authorized = Assets.getText('authorizedUsers').trim()
		this.userId.trim() is authorized

Meteor.methods(
	isAuthorized : isAuthorized
	filePickerKey : () -> 
		if Meteor.call 'isAuthorized'
			Assets.getText('fpKey')
)