module Facebook
  CONFIG = YAML.load_file(Rails.root.join("config/facebook.yml"))[Rails.env]
  APP_ID = "357983834258531"
  SECRET = "d12ea5fdf904da4b6a0ae016188a6931"
end

Koala::Facebook::OAuth.class_eval do
  def initialize_with_default_settings(*args)
    case args.size
      when 0, 1
        raise "application id and/or secret are not specified in the config" unless Facebook::APP_ID && Facebook::SECRET
        initialize_without_default_settings(Facebook::APP_ID.to_s, Facebook::SECRET.to_s, args.first)
      when 2, 3
        initialize_without_default_settings(*args) 
    end
  end 

  alias_method_chain :initialize, :default_settings 
  Koala::HTTPService.http_options[:ssl] = {:ca_file => Rails.root.join('app/assets/cacert.pem').to_s}
end