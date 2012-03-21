require 'apidocbot'
require 'rails'

module Apidocbot
  class Railtie < Rails::Railtie
    railtie_name :apidocbot

    rake_tasks do
      load "tasks/apidocbot.rake"
    end
  end
end