require 'rubygems'
require 'sinatra'

get '/' do
  send_file File.join(File.dirname(__FILE__), 'iscratcher-release.apk'), {:type => 'application/vnd.android.package-archive', :filename => 'iscratcher-release.apk'}
end