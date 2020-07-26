require %q{action_view}
require %q{active_support}
require %q{jwt}

module ArboristChatRails::TagsHelper
  extend ActiveSupport::Concern

  include ::ActionView::Helpers::AssetTagHelper
  include ::ActionView::Helpers::TagHelper

  def arborist_script_tag(config)
    javascript_include_tag(url(config, %q{widget/bundle.js}), defer: true)
  end

  def arborist_styles_tag(config)
    stylesheet_link_tag(url(config, %q{widget/styles.css}))
  end

  def arborist_widget_tag(config)
    content_tag(:div, nil, 'data-arborist-token': token(config))
  end

  private

  def url(config, path)
    if config.dev_mode
      [%q{http://localhost:3000},    path]
    else
      [%q{https://www.arborist.app}, path]
    end.join(%q{/})
  end
  
  def token(config)
    JWT.encode(payload(config), config.app_secret, %q{HS256})
  end

  def payload(config)
    {
      app_id:       config.app_id,
      current_user: instance_exec(&config.current_user)
    }
  end
end
