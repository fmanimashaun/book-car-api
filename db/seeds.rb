# create the admin user
User.find_or_create_by!(username: Rails.application.credentials.admin[:username]) do |user|
  user.password = Rails.application.credentials.admin[:password]
  user.password_confirmation = Rails.application.credentials.admin[:password]
  user.email = Rails.application.credentials.admin[:email]
  user.name = "Admin User"
  user.role = :admin
end


# Create cities
cities = [
  "New York",
  "Los Angeles",
  "Chicago",
  "Houston",
  "Phoenix",
  "Philadelphia",
  "San Antonio",
  "San Diego",
  "Dallas",
  "San Jose",
  "Austin",
  "Jacksonville",
  "Fort Worth",
  "Columbus",
  "Charlotte",
  "San Francisco",
  "Indianapolis",
  "Seattle",
  "Denver",
  "Washington"
]

cities.each { |city_name| City.find_or_create_by!(name: city_name) }

# Create car models

car_names = ['Toyota Camry', 'Honda Accord', 'Ford Mustang', 'Chevrolet Malibu', 'Hyundai Sonata', 'Nissan Altima', 'Volkswagen Passat', 'Subaru Legacy', 'Kia Optima', 'Audi A4', 'BMW 3 Series', 'Mercedes-Benz C-Class', 'Lexus ES', 'Volvo S60', 'Infiniti Q50', 'Acura TLX', 'Cadillac CT5', 'Lincoln MKZ', 'Alfa Romeo Giulia', 'Jaguar XE']
