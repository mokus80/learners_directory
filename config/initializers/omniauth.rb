Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '0f02261e0548da5b8b18', '0086c9de09468e18881b57877f165385128ba60b'
end