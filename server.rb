require 'rubygems'
require 'sinatra'
require 'thin'
require 'sass'
require 'haml'

#Configuration at Startup
configure do
  #Set SCSS Options for CSS compilation
  set :scss, {:style => :compact, :debug_info => false}
end

before do
  #might be unnescessary
  content_type :html, 'charset' => 'utf-8'
end

helpers do
  #erb html escape helper; Usage: <%= h @ruby_variable %>
  include Rack::Utils
  alias_method :h, :escape_html
end

#Rendering the stylesheets
get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss (:"stylesheets/#{params[:name]}") 
end

#Index-View
get "/" do
  haml :index
end