require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-tradeking'

ENV['CONSUMER_KEY'] = 'p8c1ZAnEBSdOcEL3ut5oJeOKPIixp4TlLf7uyHIy'
ENV['CONSUMER_SECRET'] = 'QIFWJuKYmXV8yW7hvfyZALpTIPSk8vrA3aKbAqcZ'

class App < Sinatra::Base
  get '/' do
    redirect '/auth/tradeking'
  end

  get '/auth/:provider/callback' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end

  get '/auth/failure' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end
end

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :tradeking, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
end

run App.new