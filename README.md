# Run
rails s

# Routes view
rake routes
or
{URL}/rails/info/routes

# Scaffold Example
rails g scaffold Book title:string number_of_pages:integer
rake db:migrate

# Devise install
rails g devise:install
rails g devise User
rake db:migrate

# add controller example
rails g controller StaticPages home
 
# top page
In file config/routes.rb:
 root 'static_pages#home'
Homepage: app/views/static_pages/home.html.erb
Layout: app/views/layouts/application.html.erb

# add more column of User
rails g migration add_name_and_age name:string age:integer

def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_index :users, :name, unique: true
end

rake db:migrate
rails g devise:views

And update view new and edit:
<div class="field">
    <%= f.label :name %><br />
    <%= f.text_field :name %>
</div>
<div class="field">
    <%= f.label :age %><br />
    <%= f.number_field :age %>
</div>

app/model/user.rb
  validates :name, presence: true
  validates :age, presence: true
      
app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :age]
    devise_parameter_sanitizer.permit :account_update, keys: [:name, :age]
  end
end


