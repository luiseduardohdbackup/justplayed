require 'rubygems'
require 'sinatra'
require 'time'

get '/:station/:time' do |station, time|
  sleep 1
  local_clock = Time.parse(time).localtime.strftime('%H%M')
  halt 404 unless station.downcase == 'knrk' && local_clock == '1200'
  <<HERE
<plist version="1.0">
<dict>
	<key>title</key>
	<string>Been Caught Stealing</string>
	<key>artist</key>
	<string>Jane's Addiction</string>
</dict>
</plist>
HERE
end

get '/stations' do
  <<HERE
<plist version="1.0">
<array>
	<string>KNRK</string>
	<string>KOPB</string>
</array>
</plist>
HERE
end
