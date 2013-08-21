Rails.application.config.middleware.use OmniAuth::Builder do

	if Rails.env.production?
		provider :github, 'a7d8e7164d77e348bee0', 'acb6df23d70c1c68f0b92beec4b75379584fea63'
	else
  		provider :github, '0f02261e0548da5b8b18', '0086c9de09468e18881b57877f165385128ba60b'
  	end
end