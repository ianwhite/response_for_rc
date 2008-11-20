# response_for_rc's CI task is just rc's with this stuff loaded

garlic do
  repo 'rails', :url => 'git://github.com/rails/rails'
  repo 'ianwhite-rspec', :url => 'git://github.com/ianwhite/rspec'
  repo 'ianwhite-rspec-rails', :url => 'git://github.com/ianwhite/rspec-rails'
  repo 'response_for', :url => 'git://github.com/ianwhite/response_for'
  repo 'resources_controller', :url => 'git://github.com/ianwhite/resources_controller'
  repo 'response_for_rc', :path => '.'

  target '2.2-stable', :branch => 'origin/2-2-stable'
  target '2.1-stable', :branch => 'origin/2-1-stable'
  
  all_targets do
    prepare do
      plugin 'ianwhite-rspec', :as => "rspec", :clone => true
      plugin 'ianwhite-rspec-rails', :as => "rspec-rails", :clone => true do
        sh "script/generate rspec -f"
      end
      plugin 'resources_controller', :clone => true
      plugin 'response_for', :clone => true
      plugin 'response_for_rc', :clone => true
    end
  
    run do
      cd "vendor/plugins/response_for_rc" do
        sh "rake spec && (cd ../resources_controller; rake spec:generate)"
      end
    end
  end
end
