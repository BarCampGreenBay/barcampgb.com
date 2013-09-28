require 'sinatra'
require 'sass'
require 'compass'
require 'bootstrap-sass'

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'stylesheets'
  end

  set :scss, Compass.sass_engine_options
end

get '/' do
  erb :index
end

get '/stylesheets/:name.css' do
  content_type 'text/css', charset: 'utf-8'
  scss(:"stylesheets/#{params[:name]}", Compass.sass_engine_options)
end
