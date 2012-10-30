require 'rubygems'
require 'mechanize'

PASSWORD = 'password1'
NEW_PASSWORD = 'password2'

agent = Mechanize.new
page = agent.get('http://github.com/login')

# pp page

form = page.forms.first

form.login = 'michael@moorberry.net'
form.password = PASSWORD

logged_in_page = agent.submit(form, form.buttons.first)

return nil if logged_in_page.link_with(:href => '/logout').nil?

admin_page = agent.get('http://github.com/settings/admin')

admin_form = admin_page.form_with(:id => "change_password")

admin_form.field_with({ :name => 'user[old_password]' }).value = PASSWORD
admin_form.field_with({ :name => 'user[password]' }).value = NEW_PASSWORD
admin_form.field_with({ :name => 'user[password_confirmation]' }).value = NEW_PASSWORD

post_admin_page = agent.submit(admin_form, admin_form.buttons.first)

# pp post_admin_page

return nil if post_admin_page.link_with(:href => 'https://github.com/login?return_to=%2Flogin').nil?

return "#{NEW_PASSWORD}"
# WwbaczqT
