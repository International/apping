source 'https://rubygems.org'

# Server requirements
gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

gem "eventmachine"
gem "em-http-request",:require => false
gem 'em-synchrony', :git     => 'git://github.com/igrigorik/em-synchrony.git',:require => ['em-synchrony',"em-synchrony/em-http"]


# Project requirements
gem 'rake'
gem 'sinatra-flash', :require => 'sinatra/flash'

gem 'pg',"0.13.2"
gem 'em-postgresql-adapter', :git => 'git://github.com/leftbee/em-postgresql-adapter.git'


# Component requirements
gem 'bcrypt-ruby', :require => "bcrypt"
gem 'sass'
gem 'haml'
gem 'activerecord', :require => "active_record"

# Test requirements
gem 'shoulda', :group => "test"
gem 'rack-test', :require => "rack/test", :group => "test"

# Padrino Stable Gem
gem 'padrino', '0.10.7'

group :development do
    gem 'sqlite3'
    gem "pry",:github => "pry/pry",:ref => "d350493de2432e8a20bc847a5c55a6ebc257f702"
    gem "pry-remote",:github => "Mon-Ouie/pry-remote",:ref => "c4d91dda70f4dd099abad0bbf39a7617efe85769"
    gem 'pry-stack_explorer',"0.4.5"
    gem "pry-debugger","0.2.0"
end

# Or Padrino Edge
#gem 'padrino', :git => 'git://github.com/padrino/padrino-framework.git'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.10.7'
# end
