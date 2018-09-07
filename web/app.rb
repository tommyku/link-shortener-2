require 'sinatra'

$stdout.sync = true

set :server, 'webrick'
set :environment, :production
set :port, ENV['PORT'] || 3000

get '/' do
  redirect 'https://github.com/tommyku/link-shortener-2'
end

get '/:short_key' do |short_key|
  safe_short_key = short_key
  # source: http://gavinmiller.io/2016/creating-a-secure-sanitization-function/
  bad_chars = [ '/', '\\', '?', '%', '*', ':', '|', '"', '<', '>', '.', ' ' ]
  bad_chars.each do |bad_char|
    safe_short_key.gsub!(bad_char, '')
  end

  if File.exist?("/run/links/#{safe_short_key}")
    target = File.read("/run/links/#{safe_short_key}")
    redirect target
  else
    "I've got nothing for you, try maybe another castle"
  end
end
