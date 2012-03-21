require "apidocbot/version"
require "rails"
require "erb"

module Apidocbot
  require 'apidocbot/railtie' if defined?(Rails)
  
  def self.generate_docs
    bot_path = File.join(Rails.root, 'apidocbot')
    doc_path = File.join(bot_path, 'docs')
    output_path = File.join(bot_path, 'output.html')
    template_path = File.join(bot_path, 'templates')
    
    index_template = File.open(File.join(template_path, 'index.erb.html')).read
    section_template = File.open(File.join(template_path, 'section.erb.html')).read
    item_template = File.open(File.join(template_path, 'item.erb.html')).read
    detail_template = File.open(File.join(template_path, 'detail.erb.html')).read
    
    
    yaml_files = Dir.glob("#{doc_path}/*.yml")
    #used in index template
    index_content = ""
    detail_content = ""
    ######################
    yaml_files.each do |yaml|
      File.open(yaml) do |file|
        puts "==========loading #{File.basename(yaml)}=========="
        docs = YAML::load(file)
        #userd in section template
        section_name = File.basename(yaml, '.yml').capitalize
        section_content = ""
        #########################
        docs.keys.each do |key|
          item_erb = ERB.new(item_template)
          
          #used in item template
          api = key
          description = docs[key]['description']
          params = []
          docs[key]['params'].each do |key, value|
            params << {:name => key, :description => value}
          end if docs[key]['params']
          example_request = docs[key]['example_request']
          example_response = docs[key]['example_response']
          #####################
          section_content << item_erb.result(binding)
          detail_erb = ERB.new(detail_template)
          detail_content << detail_erb.result(binding)
        end
        section_erb = ERB.new(section_template)
        index_content << section_erb.result(binding)
      end
    end
    
    index_erb = ERB.new(index_template)
    File.open(output_path, 'w') {|output| output.write(index_erb.result(binding))}
  end
end
