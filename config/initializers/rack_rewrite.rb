# twesume.herokuapp.comのアクセスをtwesumes.netにリダイレクトさせる

if ENV['RACK_ENV'] == 'production'
  TwesumeCard::Application.config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
    r301 %r{.*}, 'https://twesumes.net$&', :if => Proc.new {|rack_env|
      rack_env['SERVER_NAME'] == 'twesume.herokuapp.com'
    }
  end
end