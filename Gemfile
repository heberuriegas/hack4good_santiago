source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.0'
gem 'less-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'figaro'
gem 'haml-rails'
gem 'pg'
gem 'less-rails-bootstrap'
gem 'simple_form', '>= 3.0.0.rc'
group :assets do
  gem 'therubyracer', :platform=>:ruby
end
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
end
group :development, :test do
  gem 'rspec-rails'
  gem 'thin'
end
group :development, :production do
  gem 'newrelic_rpm'
end
group :production do
  gem 'unicorn'
  gem 'rails_12factor'
end
group :test do
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
end
