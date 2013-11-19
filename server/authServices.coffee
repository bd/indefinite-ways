isAuthorized = () ->
		console.log "checking authorization"
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