module Main
  class MailController < Volt::ModelController
    before_action :find_or_create_tenant
    before_action :remove_body_class

    after_action :set_body_class

    def index
      # set the scope to the tenant set by params
      self.model = store._tenants.where(name: params._tenant_name).first
    end

    def show
    end

    def extend_ttl
    end

    private

    def remove_body_class
      `$('body').removeClass();`
    end

    def set_body_class
      `$('body').addClass(#{params._controller} + ' ' + #{params._action});`
    end

    def unread
      store._tenants.where(name: params._tenant_name).first.then do |tenant|
        tenant._mails.count(&:_unread)
      end
    end

    def find_or_create_tenant
      # Move the find or create into task be done before rendering association bindings
      FindOrCreateTenant.run(params._tenant_name)
    end

    def index_ready
      `var favicon=new Favico({
          animation:'slide'
      });`

      store._tenants.where(name: params._tenant_name).first.then do |tenant|
        tenant._mails.on('added') do
          unread.then do |value|
            `favicon.badge(value);`
          end
        end
      end

      store._tenants.where(name: params._tenant_name).first.then do |tenant|
        tenant._mails.on('removed') do
          unread.then do |value|
            `favicon.badge(value);`
          end
        end
      end
    end
  end
end
