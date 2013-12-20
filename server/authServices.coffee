isAuthorized = () ->
		# note that at this point there is ever to be but one authorized user
		authorized = Assets.getText('authorizedUsers').trim()
		this.userId.trim() is authorized

Meteor.methods(
	isAuthorized : isAuthorized
	filePickerKey : () -> 
		# TODO: properly abstract this, rather than copy/paste...		
		# see: http://stackoverflow.com/questions/20710937/why-doesnt-arent-these-meteor-coffeescript-server-methods-equivalent
		# if isAuthorized()
		if this.userId.trim() == Assets.getText('authorizedUsers').trim()
			Assets.getText('fpKey')
)