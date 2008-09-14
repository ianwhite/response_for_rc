# response_for_rc's CI task is just rc's with this stuff loaded

garlic do
  # repo, give a url, specify :local to use a local repo (faster
  # and will still update from the origin url)
  repo 'rails', :url => 'git://github.com/rails/rails'#,  :local => "~/dev/vendor/rails"
  repo 'rspec', :url => 'git://github.com/dchelimsky/rspec'#,  :local => "~/dev/vendor/rspec"
  repo 'rspec-rails', :url => 'git://github.com/dchelimsky/rspec-rails'#, :local => "~/dev/vendor/rspec-rails"
  repo 'response_for', :url => 'git://github.com/ianwhite/response_for'#, :local => "~/dev/vendor/response_for"
  repo 'resources_controller', :url => 'git://github.com/ianwhite/resources_controller'#, :local => "~/dev/vendor/resources_controller"
  repo 'response_for', :path => '.'

  # for target, default repo is 'rails', default branch is 'master'
  target 'edge'
  target '2.1-stable', :branch => 'origin/2-1-stable'
  target '2.1.1', :tag => 'v2.1.1'
  
  all_targets do
    prepare do
      plugin 'rspec'
      plugin('rspec-rails') { sh "script/generate rspec -f" }
      plugin 'resources_controller'
      plugin 'response_for'
      plugin 'response_for_rc'
    end
  
    run do
      cd "vendor/plugins/resources_controller" do
        sh "rake spec:rcov:verify && rake spec:generate"
      end
    end
  end
end
