namespace :wedding do
  task verify: :environment do
    Person.all.each do |p|

      if p.name.match(/guest/i) && !p.user_editable
        puts "Person #{p.name} isn't editable"
      end
    end

    Family.all.each do |f|
      if f.people.count < 2
        puts "Family #{f.name} only has #{f.people.count} member(s)"
      end

      if f.people.none?{|p| !p.email.blank?}
        puts "Family #{f.name} doesn't have any email addresses"
      end
    end
  end
end
