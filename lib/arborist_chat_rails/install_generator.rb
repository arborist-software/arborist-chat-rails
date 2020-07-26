require %q{rails/generators}

class ArboristChatRails::InstallGenerator < Rails::Generators::Base
  APP_ID     = %q{app_id}
  APP_SECRET = %q{app_secret}

  class_option APP_ID,
               default: %q{APP_ID},
               desc: %q{You application ID},
               type: :string

  class_option APP_SECRET,
               default: %q{APP_SECRET},
               desc: %q{Your application secret},
               type: :string

  def create_initializer
    initializer %q{arborist.rb}, <<~FILE
      Rails.application.configure do
        # specifies which product in arborist to connect
        # the rails application to
        config.arborist.app_id     = '#{options.dig(APP_ID)}'
        config.arborist.app_secret = '#{options.dig(APP_SECRET)}'

        # identifies a user. by default this is limited to anomous
        # identification (note: this uses cookies so notify users 
        # appropriately). the current_user lambda will be executed
        # in the current controllers context so all methods in the
        # controller will be available
        config.arborist.current_user = lambda do
          { id: session[:arborist_id] ||= SecureRandom.uuid }
        end
      end
    FILE
  end
end
