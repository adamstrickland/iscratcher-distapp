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

def android_app_dir
  File.join(File.dirname(__FILE__), '..', 'android', 'iscratcher-app')
end

def android_dist_dir
  File.join(android_app_dir, "bin")
end

def ant_build_file
  File.join(android_app_dir, "build.xml")
end

def release_file_name
  "iscratcher-release"
end

def major_version; 1; end
def minor_version; 1; end
def revision; 1; end

def version
  [major_version, minor_version, revision].join('.')
end

def release_file_type
  "apk"
end

def release_file
  "#{release_file_name}.#{release_file_type}"
end

task :default => :dist

task :build do
  system "ant -f #{ant_build_file} release"
end

task :dist => [:build, 'dist:dist']

namespace :dist do
  task :init do
    require 'git'
    require 'logger'
    
    # rm release_file
    # # new_release = "#{release_file_name}-"Dir[File.join(File.dirname(__FILE__), "#{release_file_name}*")].count
    # mv release_file_name, ""
    # cp File.join(android_dist_dir, release_file_name) 
    system "cp #{File.join(android_dist_dir, release_file)} ./#{release_file}"
  end

  task :dist => :init do
    # system "git push origin master && git push heroku master"
    # system "cd ../android/iscratcher-app && ant release && cp bin/iscratcher-release.apk ../../distapp && cd ../../distapp && git add iscratcher-release.apk && git commit -m 'rake dist' && git push origin master && git push heroku master"
    g = Git.open File.dirname(__FILE__), :log => Logger.new(STDOUT)
    # g = Git.open File.dirname(__FILE__)
    g.add release_file
    g.commit_all "rake dist"
    g.push(g.remote('origin'))
    g.push(g.remote('heroku'))
  end
end
