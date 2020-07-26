require 'rails'

class Arborist::Railtie < Rails::Railtie
  railtie_name :arborist

  config.arborist = ActiveSupport::OrderedOptions.new

  generators do
    require %q{arborist/install_generator.rb}
  end

  initializer %q{arborist} do |app|
    app.config.arborist.dev_mode ||= false

    ActiveSupport.on_load :action_view do
      include ::Arborist::TagsHelper
    end

    ActiveSupport.on_load :action_controller do
      include ::Arborist::TagsHelper

      after_action  :include_arborist_livechat
      define_method :include_arborist_livechat do
        next unless response.media_type == %q{text/html}

        widget = arborist_widget_tag(app.config.arborist).to_s
        styles = arborist_styles_tag(app.config.arborist).to_s unless app.config.arborist.dev_mode
        script = arborist_script_tag(app.config.arborist).to_s

        insert_index  = response.body.rindex(%q{</body>})
        response.body = response.body.insert(insert_index, [
          widget,
          styles,
          script,
        ].compact.join(%q{}))
      end
    end
  end
end
