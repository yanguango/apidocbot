require 'rails'
require 'fileutils'

class ApidocbotGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)
 
  def copy_initializer_file
    docs_dir = File.join(Rails.root, 'apidocbot/docs')
    templates_dir = File.join(Rails.root, 'apidocbot/templates')
    FileUtils.mkdir_p docs_dir
    FileUtils.mkdir_p templates_dir
    %w(index.erb.html section.erb.html item.erb.html detail.erb.html).each do |template|
      copy_file template, File.join(templates_dir, template)
    end
    
    copy_file "user.yml", File.join(docs_dir, "user.yml")
  end
end