# Where the I18n library should search for translation files
I18n.load_path += Dir["#{Rails.root}/config/locales/models/*.yml"]
I18n.load_path += Dir["#{Rails.root}/config/locales/views/*.yml"]
I18n.load_path += Dir["#{Rails.root}/config/locales/interactors/*/*.yml"]
I18n.load_path += Dir["#{Rails.root}/config/locales/devise/*.yml"]
I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]

# Permitted locales available for the application
I18n.available_locales = %i[en pt-BR ja es]

# Set default locale to something other than :en
I18n.default_locale = :'pt-BR'
