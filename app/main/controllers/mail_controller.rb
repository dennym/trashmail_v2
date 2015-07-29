module Main
  class MailController < Volt::HttpController
    # def index
    #   self.model = :store
    # end

    def create

      data = request.body.read
      puts data
      # store._mails! << Link.new(data)
    end

    # def show
    #   self.model = store._mails.where(_id: params._id).fetch_first
    # end
  end
end
