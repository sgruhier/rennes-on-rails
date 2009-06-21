# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rennesOnRails_session',
  :secret      => 'b74335366f6be0da54a22cd82cd32fe8688a21b1ab151e09c8d522a079bbaf9c199e6a3ecbd506d810952cc2c4a4beae59f28badbe4ed6044989fe8615f62e32'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
