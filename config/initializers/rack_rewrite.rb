# twesume.herokuapp.comのアクセスをtwesume.workにリダイレクトさせる

if ENV['RACK_ENV'] == 'production'
  TwesumeCard::Application.config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
    r301 %r{.*}, 'https://twesume.work$&', :if => Proc.new {|rack_env|
      rack_env['SERVER_NAME'] == 'twesume.work.herokuapp.com'
    }
  end
end