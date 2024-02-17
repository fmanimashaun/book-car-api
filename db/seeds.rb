# create the admin user
users = User.find_or_create_by!(username: Rails.application.credentials.admin[:username]) do |user|
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
car_names.each_with_index { |car_name, index| Car.find_or_create_by!(name: car_name, description: "Description #{index + 1}") }

Reservation.create!(date: Date.tomorrow, car: Car.first, city: City.first, user: User.first)
Reservation.create!(date: Date.tomorrow, car:Car.last, city: City.last, user: User.last)
# Create engine types
engine_types = [
  "4-cylinder",
  "V6",
  "Hybrid",
  "Turbocharged 4-cylinder",
  "Electric"
]

engine_types.each do |engine_type_name|
  EngineType.find_or_create_by!(name: engine_type_name)
end

# Create car models

car = [
  {
    name: 'Toyota Camry',
    description:
      'Reliable and spacious sedan with comfortable seating for five. Great fuel efficiency and smooth ride for commuting or road trips.',
    car_details: {
      engine_type_id: 1,
      horsepower: 203,
      torque: 184,
      fuel_economy: '32 mpg',
      seating_capacity: 5,
      cargo_space: '15.1 cu ft',
      infotainment_system: '7-inch touchscreen, Apple CarPlay/Android Auto',
      safety_rating: '5-star NHTSA',
      tech_features: 'Bluetooth, Backup Camera, Adaptive Cruise Control',
      special_features: 'LED Headlights, Available panoramic sunroof'
    }
  },
  {
    name: 'Honda Accord',
    description:
      'Sporty yet sensible, the Accord offers enjoyable handling, ample passenger room, and excellent gas mileage.',
    car_details: {
      engine_type_id: 4,
      horsepower: 192,
      torque: 192,
      fuel_economy: '33 mpg',
      seating_capacity: 5,
      cargo_space: '16.7 cu ft',
      infotainment_system: '8-inch touchscreen, Apple CarPlay/Android Auto',
      safety_rating: '5-star NHTSA',
      tech_features: 'Bluetooth, Backup Camera, Honda Sensing Safety Suite',
      special_features: 'Available Head-up Display, Ventilated Front Seats'
    }
  },
  {
    name: 'Chevrolet Malibu',
    description:
      'Stylish and affordable mid-size sedan. Quiet ride, modern infotainment system, and fuel-efficient option.',
    car_details: {
      engine_type_id: 4,
      horsepower: 160,
      torque: 184,
      fuel_economy: '32 mpg',
      seating_capacity: 5,
      cargo_space: '15.7 cu ft',
      infotainment_system: 'Chevrolet Infotainment 3 with 8-inch touchscreen',
      safety_rating: '5-star NHTSA',
      tech_features: 'Bluetooth, Backup Camera, Teen Driver Technology',
      special_features: 'Available Wi-Fi Hotspot, Wireless Charging'
    }
  },
  {
    name: 'Hyundai Sonata',
    description:
      'Value-packed sedan with eye-catching design, intuitive technology, and a generous warranty.',
    car_details: {
      engine_type_id: 1,
      horsepower: 191,
      torque: 181,
      fuel_economy: '32 mpg',
      seating_capacity: 5,
      cargo_space: '16 cu ft',
      infotainment_system: '8-inch touchscreen, Hyundai Bluelink Connectivity',
      safety_rating: 'Top Safety Pick+ (IIHS)',
      tech_features:
        'Forward Collision Avoidance, Smart Cruise Control, Lane Keep Assist',
      special_features:
        'Hyundai Digital Key, Panoramic Sunroof, 10-year/100,000-mile Warranty'
    }
  },
  {
    name: 'Nissan Altima',
    description:
      'Comfortable and practical. Ideal for everyday driving with responsive handling and a roomy interior.',
    car_details: {
      engine_type_id: 1,
      horsepower: 188,
      torque: 180,
      fuel_economy: '31 mpg',
      seating_capacity: 5,
      cargo_space: '15.4 cu ft',
      infotainment_system: 'NissanConnect with 8-inch touchscreen',
      safety_rating: 'Top Safety Pick+ (IIHS)',
      tech_features:
        'Automatic Emergency Braking, Intelligent Forward Collision Warning',
      special_features: 'Zero Gravity Seats (comfort focused), Available AWD'
    }
  },
  {
    name: 'Volkswagen Passat',
    description:
      'European-inspired handling in a spacious, affordable package. A refined choice for longer rides.',
    car_details: {
      engine_type_id: 4,
      horsepower: 174,
      torque: 206,
      fuel_economy: '28 mpg',
      seating_capacity: 5,
      cargo_space: '15.9 cu ft',
      infotainment_system:
        'Composition Media touchscreen, App-Connect smartphone integration ',
      safety_rating: '5-star NHTSA (Check for recent model year)',
      tech_features: 'Automatic Post-Collision Braking, Blind Spot Monitoring',
      special_features: 'Spacious Rear Legroom,  Quiet and Comfortable Ride'
    }
  },
  {
    name: 'Subaru Legacy',
    description:
      'The only standard all-wheel-drive sedan in its class. Perfect for all-weather adventures and enhanced traction.',
    car_details: {
      engine_type_id: 1,
      horsepower: 182,
      torque: 176,
      fuel_economy: '30 mpg',
      seating_capacity: 5,
      cargo_space: '15.1 cu ft',
      infotainment_system: 'STARLINK Multimedia with 7-inch touchscreen',
      safety_rating: 'Top Safety Pick+ (IIHS)',
      tech_features:
        'EyeSight Driver Assist Technology, Adaptive Cruise Control',
      special_features:
        'Symmetrical All-Wheel Drive, X-Mode (enhanced off-road traction)'
    }
  },
  {
    name: 'Kia Optima',
    description:
      'Sharp looks, comfortable cabin, and impressive technology features make the Optima a smart and stylish choice.',
    car_details: {
      engine_type_id: 1,
      horsepower: 185,
      torque: 178,
      fuel_economy: '31 mpg',
      seating_capacity: 5,
      cargo_space: '15.9 cu ft',
      infotainment_system: 'UVO infotainment with 8-inch touchscreen',
      safety_rating: 'Top Safety Pick (IIHS - verify model year)',
      tech_features:
        'Forward Collision Warning, Blind Spot Detection, Kia Drive Wise Features',
      special_features:
        'Sporty exterior styling,  Available Panoramic Sunroof, Harman Kardon Sound System'
    }
  },
  {
    name: 'Audi A4',
    description:
      "Upscale interior, responsive handling, and Audi's legendary Quattro all-wheel drive for sporty confidence.",
    car_details: {
      engine_type_id: 4,
      horsepower: 261,
      torque: 273,
      fuel_economy: '28 mpg',
      seating_capacity: 5,
      cargo_space: '12 cu ft',
      infotainment_system: '10.1-inch MMI Touch Display, Virtual Cockpit',
      safety_rating: 'Top Safety Pick+ (IIHS)',
      tech_features:
        'Pre-Sense Automatic Braking, Lane Departure Warning, Wireless Charging',
      special_features:
        'Bang & Olufsen Sound System, Panoramic Sunroof, Leather Upholstery'
    }
  },
  {
    name: 'BMW 3 Series',
    description:
      'The benchmark for sports sedans. Athletic handling, powerful engines, and a high-end cabin.',
    car_details: {
      engine_type_id: 4,
      horsepower: 255,
      torque: 295,
      fuel_economy: '29 mpg',
      seating_capacity: 5,
      cargo_space: '13 cu ft',
      infotainment_system: 'iDrive 7.0 with touchscreen and gesture control',
      safety_rating: 'Top Safety Pick+ (IIHS) or similar',
      tech_features:
        'Driving Assistant Professional, Active Blind Spot Detection, Parking Assistant',
      special_features:
        'M Sport Package (handling upgrades), Premium Leather Upholstery, Advanced Driving Dynamics'
    }
  },
  {
    name: 'Mercedes-Benz C-Class',
    description:
      'Epitome of luxury. Comfortable ride, sophisticated interior, and a brand renowned for prestige.',
    car_details: {
      engine_type_id: 4,
      horsepower: 255,
      torque: 295,
      fuel_economy: '27 mpg',
      seating_capacity: 5,
      cargo_space: '12.6 cu ft',
      infotainment_system: 'MBUX infotainment system with voice control',
      safety_rating: 'Top Safety Pick+ (IIHS) or similar',
      tech_features:
        'Active Brake Assist, Pre-Safe (anticipatory safety systems), Attention Assist (drowsiness detection)',
      special_features:
        'Burmester Surround Sound System,  Ambient Interior Lighting,  Optional Air Suspension'
    }
  },
  {
    name: 'Lexus ES',
    description:
      'Prioritizes comfort and refinement. Whisper-quiet cabin, plush seats, and renowned Lexus reliability.',
    car_details: {
      engine_type_id: 2,
      horsepower: 302,
      torque: 267,
      fuel_economy: '26 mpg',
      seating_capacity: 5,
      cargo_space: '16.7 cu ft',
      infotainment_system:
        'Lexus Enform system with touchscreen and voice control',
      safety_rating: 'Top Safety Pick+ (IIHS)',
      tech_features:
        'Lexus Safety System+ 2.5 (pre-collision warning, lane departure alert, etc.), Adaptive Cruise Control',
      special_features:
        'Mark Levinson Surround Sound System, Heated and Ventilated Seats, Heads-Up Display (optional)'
    }
  },
  {
    name: 'Volvo S60',
    description:
      'Scandinavian design with excellent safety ratings. Understated elegance and innovative technology.',
    car_details: {
      engine_type_id: 4,
      horsepower: 247,
      torque: 258,
      fuel_economy: '28 mpg',
      seating_capacity: 5,
      cargo_space: '11.6 cu ft',
      infotainment_system: 'Sensus Connect with 9-inch vertical touchscreen',
      safety_rating: 'Top Safety Pick+ (IIHS)',
      tech_features:
        'City Safety (Collision Mitigation), Pilot Assist (Semi-Autonomous Driving), Road Sign Detection',
      special_features:
        'CleanZone Interior Air Quality System,  Bowers & Wilkins Sound, Scandinavian Design Elements'
    }
  },
  {
    name: 'Infiniti Q50',
    description:
      'Powerful engine choices and driver-oriented feel. Offers sporty performance in a luxurious package.',
    car_details: {
      engine_type_id: 2,
      horsepower: 300,
      torque: 295,
      fuel_economy: '23 mpg',
      seating_capacity: 5,
      cargo_space: '13.5 cu ft',
      infotainment_system: 'Infiniti InTouch dual-screen system',
      safety_rating: 'Top Safety Pick (IIHS) - check for the newest model year',
      tech_features:
        'Predictive Forward Collision Warning, ProPILOT Assist (adaptive cruise)',
      special_features:
        'Direct Adaptive Steering (unique option), Sport Seats,  Available AWD'
    }
  },
  {
    name: 'Acura TLX',
    description:
      "Combines a sporty character with Acura's reputation for reliability and a well-appointed interior.",
    car_details: {
      engine_type_id: 4,
      horsepower: 272,
      torque: 280,
      fuel_economy: '25 mpg',
      seating_capacity: 5,
      cargo_space: '13.5 cu ft',
      infotainment_system: 'True Touchpad Interface with 10.2-inch screen',
      safety_rating: 'Top Safety Pick+ (IIHS)',
      tech_features:
        'AcuraWatch Safety Suite, Adaptive Cruise Control, Traffic Jam Assist',
      special_features:
        "ELS Studio 3D Premium Audio, Sport Seats, Available 'Type S' Performance Variant"
    }
  },
  {
    name: 'Genesis G80',
    description:
      'Luxury sedan with a strong value proposition. Spacious cabin, refined ride, and a long list of standard features.',
    car_details: {
      engine_type_id: 4,
      horsepower: 300,
      torque: 311,
      fuel_economy: '26 mpg',
      seating_capacity: 5,
      cargo_space: '13.1 cu ft',
      infotainment_system: '14.5-inch touchscreen, Genesis Connected Services',
      safety_rating: 'Top Safety Pick+ (IIHS)',
      tech_features:
        'Highway Driving Assist (adaptive cruise + lane centering), Forward Collision Avoidance',
      special_features:
        'Lexicon Premium Audio, Nappa Leather Seating,  10-year/100,000-mile Powertrain Warranty'
    }
  },
  {
    name: 'Tesla Model 3',
    description:
      'Electric car with impressive range and rapid acceleration. Cutting-edge technology and minimalist design.',
    car_details: {
      engine_type_id: 5,
      horsepower: 283,
      torque: 325,
      seating_capacity: 5,
      cargo_space: '15 cu ft + front trunk',
      infotainment_system:
        '15-inch central touchscreen (controls most functions)',
      safety_rating: '5-star NHTSA, Top Safety Pick+ (IIHS)',
      tech_features:
        'Autopilot (adaptive cruise + lane control), Over-the-Air Updates, Sentry Mode (security system)',
      special_features:
        'Supercharger Network Access, Full Self-Driving Capability (optional), Unique Design Features'
    }
  },
  {
    name: 'Porsche Taycan',
    description:
      "Electric sports car with breathtaking performance and a luxurious interior. A true driver's car.",
    car_details: {
      engine_type_id: 5,
      horsepower: 402,
      torque: 469,
      seating_capacity: 4,
      cargo_space: '14.3 cu ft (split between front & rear)',
      infotainment_system:
        'Porsche Communication Management (PCM), Curved Digital  Display',
      safety_rating:
        'Not yet rated (NHTSA/IIHS) likely due to low sales volume',
      tech_features:
        'Adaptive Cruise Control,  Porsche Dynamic Chassis Control (PDCC - adaptive suspension)',
      special_features:
        '800-volt Battery Architecture (fast charging), Overboost and Launch Control, Porsche Recuperation Management (energy recovery)'
    }
  },
  {
    name: 'Jaguar XE',
    description:
      'Nimble and luxurious compact sport sedan known for its engaging performance and British heritage.',
    car_details: {
      engine_type_id: 4,
      horsepower: 247,
      torque: 269,
      fuel_economy: '26 mpg',
      seating_capacity: 5,
      cargo_space: '14.7 cu ft',
      infotainment_system: 'Jaguar InControl Touch Pro Duo',
      safety_rating: '5-star Euro NCAP (adjust if NHTSA/IIHS available)',
      tech_features:
        'Adaptive Dynamics (adjustable suspension),  Configurable Dynamics (drivetrain customization)',
      special_features:
        'JaguarDrive Control (sport modes), Meridian Sound System (Optional), Wood Veneer trim'
    }
  },
  {
    name: 'Maserati Ghibli',
    description:
      'Italian luxury and performance. A stylish and exclusive choice for those who appreciate the finer things.',
    car_details: {
      engine_type_id: 2,
      horsepower: 345,
      torque: 369,
      fuel_economy: '19 mpg',
      seating_capacity: 5,
      cargo_space: '17.7 cu ft',
      infotainment_system:
        'Maserati Touch Control Plus (MTC+) with 10.1-inch screen',
      safety_rating: 'Not fully rated (likely due to low volume)',
      tech_features:
        'Highway Assist System (adaptive cruise + lane keep), Skyhook Performance Suspension',
      special_features:
        'Ferrari-Built Engine,  Pieno Fiore Italian Leather, Choice of  Zegra Silk or Wood Trim, Unique Exhaust note'
    }
  },
  {
    name: 'Cadillac CT5',
    description:
      'American luxury with bold styling and modern technology. Spacious interior and smooth driving dynamics.',
    car_details: {
      engine_type_id: 4,
      horsepower: 237,
      torque: 258,
      fuel_economy: '27 mpg',
      seating_capacity: 5,
      cargo_space: '11.9 cu ft',
      infotainment_system:
        'Cadillac User Experience (CUE) with 10-inch touchscreen',
      safety_rating: 'Top Safety Pick (IIHS) (may vary per year)',
      tech_features:
        'Super Cruise (hands-free highway driving), Magnetic Ride Control (adaptive suspension)',
      special_features:
        'Available Bose Sound System,  Head-Up Display, Luxurious Interior Material Choices'
    }
  },
  {
    name: 'Lincoln MKZ',
    description:
      'Comfort-focused luxury sedan with an elegant interior, quiet ride, and a focus on relaxation.',
    car_details: {
      engine_type_id: 2,
      horsepower: 350,
      torque: 400,
      fuel_economy: '20 mpg',
      seating_capacity: 5,
      cargo_space: '15.4 cu ft',
      infotainment_system:
        'SYNC 3 with touchscreen, Lincoln Connect (remote features)',
      safety_rating:
        'Top Safety Pick+ (IIHS) - check for most recent model year',
      tech_features:
        'Co-Pilot 360 (Adaptive Cruise, Lane Keeping, etc.), Active Noise Control',
      special_features:
        'Revel Premium Audio System, Massage Seats (Available),  Lincoln Embrace (greeting sequence)'
    }
  },
  {
    name: 'Alfa Romeo Giulia',
    description:
      'Italian flair and passionate driving experience. Athletic handling and striking design set it apart.',
    car_details: {
      engine_type_id: 4,
      horsepower: 280,
      torque: 306,
      fuel_economy: '27 mpg',
      seating_capacity: 5,
      cargo_space: '12 cu ft',
      infotainment_system:
        '8.8-inch touchscreen with rotary controller, Alfa Connect',
      safety_rating: 'Top Safety Pick+ (IIHS)',
      tech_features:
        'Alfa DNA Drive Mode Selector (adjusts throttle, steering, etc.), Limited-Slip Differential',
      special_features:
        'Italian Design and Craftsmanship,  Available Quadrifoglio Performance Trim, Sport-Tuned Suspension'
    }
  },
  {
    name: 'Ford Mustang',
    description:
      'Iconic American muscle car with powerful engine options and bold styling.',
    car_details: {
      engine_type_id: 1,
      horsepower: 310,
      torque: 350,
      fuel_economy: '25 mpg',
      seating_capacity: 4,
      cargo_space: '13.5 cu ft',
      infotainment_system: 'SYNC 3 infotainment, Optional large touchscreen',
      safety_rating: '5-star NHTSA',
      tech_features: 'Rear View Camera, Track Apps (performance metrics)',
      special_features:
        'Available V8 Engine,  Recaro Seats, MagneRide Suspension'
    }
  }
]

car.each do |car|
  new_car = Car.find_or_initialize_by(name: car[:name])
  if new_car.new_record?
    new_car.description = car[:description]
    new_car.build_car_detail(car[:car_details])
    new_car.save
  end
end
