module Main
  class ApiController < Volt::HttpController
    def create
      render json: 403 and return unless auth(request.params[:to])

      store._tenants.create(name: tenant(request.params[:to]))

      store._tenants.where(name: tenant(request.params[:to])).first.then do |tenant|
        tenant._mails.create(request.params.merge(createdAt: Time.now))
      end

      render json: 200
    end

    def tenant(email)
      email.gsub(/@[^\s]+/,"")
    end

    def auth(email)
      email.match(/^[^@]+@ichtudas\.de$/)
    end
  end
end
