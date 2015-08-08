module Main
  class MailController < Volt::ModelController
    before_action :find_or_create_tenant

    def index
      # set the scope to the tenant set by params
      self.model = store._tenants.where(name: params._tenant).first
    end

    private

    def unread
      store._tenants.where(name: params._tenant).first.then do |tenant|
        tenant._mails.count(&:_unread)
      end
    end

    def find_or_create_tenant
      store._tenants.where(name: params._tenant).size.then do |size|
        if size == 0
          store._tenants.create(name: params._tenant)
        end
      end
    end

    def index_ready
      `var favicon=new Favico({
          animation:'slide'
      });`

      store._tenants.where(name: params._tenant).first.then do |tenant|
        tenant._mails.on('added') do
          unread.then do |value|
            `favicon.badge(value);`
          end
        end
      end
    end
  end
end
