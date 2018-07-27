Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, '1629815510462908', '12549d49a0f05864699f667a751708c3'
 provider :linkedin, "81lhqig212st0w", "qyip9tLacjAbZfpq"
 provider :google_oauth2, '571338591506-qpm954k1ggrh07qtvehprmb3jh1rbm5e.apps.googleusercontent.com', 'GnQopkFVeSsqrlqZQkGzAZS6', skip_jwt: true
 
 provider :twitter, 'fi9gJruqEVrjFUZPVqx3MUIjK', 'nUseKPGMgodsM04ISNK8jA3UKYHrqz2h1XB6E5CBFYDdFMKhYN'

end