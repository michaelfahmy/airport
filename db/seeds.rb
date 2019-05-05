if Rails.env.development?
  User.create!(
    first_name: 'Admin',
    last_name: 'One',
    role: 'manager',
    email: 'admin1@uala.com',
    password: 'admin1@uala.com',
    password_confirmation: 'admin1@uala.com'
  )
end
