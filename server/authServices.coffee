isAuthorized = () ->
		# console.log Assets.getText('authorizedUsers') 
		# console.log this.userId.replace('\w', '')
		this.userId == Assets.getText('authorizedUsers')

Meteor.methods(
	isAuthorized : isAuthorized
	filePickerKey : () -> 
		# TODO: properly abstract this, rather than copy/paste...		
		if this.userId == Assets.getText('authorizedUsers')
			Assets.getText('fpKey')
		else
			Meteor.Error 403, 'Error 403: Forbidden'
)