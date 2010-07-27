# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

# require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

# require 'tasks/rails'
# 
# task :start do
#   system "thin --debug start"
# end
# 
# task :js do
#   puts "--- Compiling Javascripts ---"
#   system "java -jar lib/compiler.jar --js=public/app.js --js_output_file=public/app.min.js"
# end

task :dist do
  # system "git push origin master && git push heroku master"
  system "cd ../android/iscratcher-app && ant release && cp bin/iscratcher-release.apk ../../distapp && cd ../../distapp && git push origin master && git push heroku master"
end
