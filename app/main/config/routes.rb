# See https://github.com/voltrb/volt#routes for more info on routes

post "/mail_inbound", controller: 'api', action: 'create'

client '/inbox/{{ tenant_name }}', controller: 'mail', action: 'index'

client '/about', action: 'about'

# The main route, this should be last. It will match any params not
# previously matched.
client '/', action: 'index'
