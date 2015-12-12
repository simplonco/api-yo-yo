require 'rake'

namespace :server do
	task :start do
	  puts 'Start API HTTP YoYo'
	  system 'ruby app.rb'
	end

	task :stop do
	  puts 'Stop API HTTP YoYo'
	  system 'pkill ruby'
	end

	task restart: [:stop, :start] do
	end
end