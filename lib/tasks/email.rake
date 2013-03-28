namespace :wedding do
  namespace :email do

    task test_invite: :environment do
      u = Person.where(name: "Isaac Cambron").first
      PonyRide.new("test", "update1").mail(u)
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


  end
end
