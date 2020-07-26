require %q{rails/generators}

class Arborist::InstallGenerator < Rails::Generators::Base
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
        # specifies which product in arborsti to connect
        # the rails application to
        config.arborist.app_id     = '#{options.dig(APP_ID)}'
        config.arborist.app_secret = '#{options.dig(APP_SECRET)}'

        # used to resolve which fields to send to
        # arborist to identify a user
        config.arborist.current_user = lambda do
          current_user&.as_json(only: %i[email id]) || begin
            { id: session[:arborist_id] ||= SecureRandom.uuid }
          end
        end
      end
    FILE
  end
end
