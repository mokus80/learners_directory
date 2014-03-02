Rails.application.config.middleware.use OmniAuth::Builder do
	yaml_file_path = "#{Rails.root}/config/github.yml"
	if File.exists? (yaml_file_path)
		config = YAML.load_file(yaml_file_path)
		client_id = config['CLIENT_ID']
		secret = config['CLIENT_SECRET']
	else
		client_id = ENV['CLIENT_ID']
		secret = ENV['CLIENT_SECRET']
	end
	provider :github, client_id, secret 
end