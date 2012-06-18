Factory.define :user do |u|
  #u.email " Factory.next(:email) "
  u.email "test@email.com"
  u.password 'password'
  u.password_confirmation 'password'
end

Factory.define :list do |l|
  #u.email " Factory.next(:email) "
  l.name "home"
  l.description 'To do list for home'
end