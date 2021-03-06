require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TwesumeCard
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  
    #日本時刻設定
    config.time_zone = 'Tokyo'

    #日本語化
    config.i18n.default_locale = :ja

    #validation error時の表示設定
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      if instance.kind_of?(ActionView::Helpers::Tags::Label)
        # skip when label
        html_tag.html_safe
      else
        "<div class=\"has-error\">#{html_tag}<span class=\"help-block text-danger\">#{instance.error_message.first}</span></div>".html_safe
      end
    end


  end
end
