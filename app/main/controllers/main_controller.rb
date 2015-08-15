# By default Volt generates this controller for your Main component
module Main
  class MainController < Volt::ModelController
    before_action :remove_body_class
    after_action :set_body_class

    def index
    end

    def about
    end

    def do_login
      redirect_to('/inbox/' + page._login)
    end

    private

    def remove_body_class
      `$('body').removeClass();`
    end

    def set_body_class
      `$('body').addClass('main ' + #{params._action});`
    end

    # The main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._component, params._controller, and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end

    # Determine if the current nav component is the active one by looking
    # at the first part of the url against the href attribute.
    def active_tab?
      url.path.split('/')[1] == attrs.href.split('/')[1]
    end
  end
end
