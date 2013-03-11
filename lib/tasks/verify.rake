namespace :wedding do
  task verify: :environment do
    Person.all.each do |p|

      if p.name.match(/guest/i) && !p.name.user_editable
        puts "Person #{p.name} isn't editable"
      end
    end

    Family.all.each do |f|
      if f.people.count < 2
        puts "Family #{f.name} only has #{f.people.count} members"
      end
    end
  end
end
