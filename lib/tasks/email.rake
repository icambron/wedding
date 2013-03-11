namespace :wedding do
  namespace :email do

    task test_invite: :environment do
      u = Person.where(name: "Isaac Cambron").first
      PonyRide.new("test", "invite").mail(u)
    end

    task invite: :environment do
      ride = PonyRide.new "Anjali and Isaac's wedding", "invite"

      Person.all.each do |u|
        ride.mail u
      end
    end
  end
end
