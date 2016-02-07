Meteor.startup ->
  sAlert.config
    effect: 'bouncyflip'
    position: 'bottom-left'
    timeout: 3000
    html: false
    onRouteClose: true
    stack: false
    offset: 50
    beep: false
