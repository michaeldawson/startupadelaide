# app/models/site_configuration.rb
 
class SiteConfiguration < ActiveRecord::Base
	# attr_accessible :key
	# attr_accessible :value
	# attr_accessible :form_type
	# attr_accessible :form_collection_command

  serialize :value
 
  class_attribute :settings
  self.settings = []
 
  def self.ensure_created
    self.settings.each do |setting|
      self.send(setting)
    end
  end
 
  def self.setting(name, default, form_type, form_collection_command="")
    class_eval <<-EOC
      self.settings << "#{name}"
      def self.#{name}
        @#{name} ||= self.find_or_create_by(key: "#{name}")
        @#{name}.update(value: #{default}, form_type: "#{form_type}", form_collection_command: "#{form_collection_command}") if !@#{name}.value
        @#{name}.reload.value
      end
      def self.#{name}=(value)
        record = self.find_or_create_by(key: "#{name}")
        #, value: #{default}, form_type: "#{form_type}", form_collection_command: "#{form_collection_command}")
        record.value = value
        record.save!
        #@#{name} = value
      end
    EOC
  end
 
  # Define settings by listing them here
    setting :site_name, "'Startup Adelaide'", :string
    setting :legal_name, "'Startup Adelaide Inc'", :string
    setting :contact_email, "'brandycontent@gmail.com'", :string
    setting :admin_email, "'brandycontent@gmail.com'", :string
    setting :contact_phone, "'0435 129 029'", :string
    setting :business_address, "'Lvl 2, 14 Grenfell St, Adelaide SA 5000'", :string
    setting :twitter_url, "'https://twitter.com/StartupADL'", :string
 
  # Ensure all the defaults are created when the class file is read
  #self.ensure_created if ActiveRecord::Base.connection.table_exists? 'site_configurations'
end

