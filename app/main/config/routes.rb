# See https://github.com/voltrb/volt#routes for more info on routes

post "/mail_income", controller: 'mail', action: 'create'

client '/about', action: 'about'

# The main route, this should be last. It will match any params not
# previously matched.
client '/', {}
