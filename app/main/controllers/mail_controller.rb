module Main
  class MailController < Volt::ModelController
    def index
      # set the scope to the tenant set by params
      # self.model = store._tenants.where(name: params._name).first.then.mails
      self.model = store._tenants.where(name: params._tenant).first
    end
  end
end
