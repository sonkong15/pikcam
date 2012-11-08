Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :twitter, 'LKcWhFRlwwAMgwVExGVKAw', 'qNnMYgROAk0g1B45hEpnQjpsZoiTDgqQPsWBTKY'
  provider :facebook, '357983834258531', 'd12ea5fdf904da4b6a0ae016188a6931',
  {:scope => 'publish_stream, offline_access, email', :image_size => "large",
   client_options: {ssl: {ca_file: Rails.root.join('app/assets/cacert.pem').to_s}}}  
end