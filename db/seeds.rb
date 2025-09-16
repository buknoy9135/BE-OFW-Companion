# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.find_or_create_by!(email: "admin@email.com") do |user|
  user.first_name = "Jalil"
  user.last_name = "Abulais"
  user.contact_number = "+639937007698"
  user.current_address = "123 Main St, Cebu"
  user.time_zone = "Hong Kong"
  user.password = ENV.fetch("ADMIN_PASSWORD", "AdminUser@123")
  user.password_confirmation = ENV.fetch("ADMIN_PASSWORD", "AdminUser@123")
  user.confirmed_at = Time.now
end
