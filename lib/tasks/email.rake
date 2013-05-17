namespace :wedding do
  namespace :email do

    task test_invite: :environment do
      u = Person.where(name: "Isaac Cambron").first
      PonyRide.new("test", "registry").mail(u)
    end

    task invite: :environment do
      ride = PonyRide.new "Anjali and Isaac's wedding", "invite"

      Person.all.each do |u|
        puts u.name
        ride.mail u
      end
    end

    task update: :environment do
      ride = PonyRide.new "Wedding updates", "update1"
      Person.all.each do |u|
        puts u.name
        ride.mail u
      end
    end

    task registry: :environment do
      ride = PonyRide.new "More wedding updates", "registry"
      Person.all.each do |u|
        puts u.name
        ride.mail u
      end
    end

    task buses: :environment do
      ride = PonyRide.new "Buses", "buses"
      Person.where(attending: true).each do |u|
        puts u.name
        ride.mail u
      end
    end
  end
end
