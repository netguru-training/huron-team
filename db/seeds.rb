beer_names = ["Guiness", "Smithwicks", "Imperial Stout Porter", "Frater", "Pilzner Urquell", "Carlsberg"]
beer_kinds = %w(Stout Ale Porter Pszeniczne Pilzner Lager)

beer_names.each_with_index do |bn, i|
  Beer.where(name: bn).first_or_create do |b|
    b.kind = beer_kinds[i]
  end
end

User.where(email: 'owner@example.com').first_or_create do |owner|
  owner.name = 'Jan Kowalski'
  owner.password = 'adminadmin'
  owner.add_role(User::ROLES.first)
end

User.where(email: 'geek@user.com').first_or_create do |geek|
  geek.name = "John Doe"
  geek.password = "foo2bar4"
  geek.add_role(User::ROLES.last)
end

20.times do |i|
  User.where(email: Faker::Internet.email).first_or_create do |user|
    user.name = Faker::Name.name
    user.password = Faker::Internet.password
    user.add_role(User::ROLES.sample)
  end
end

beers = Beer.all

bar_names = ["Kontynuacja", "Biała Małpa", "Złoty Osioł", "Niebo", "Kocioł", "Browariat"]
owners = User.all.select { |x| x.has_role?(:bar_owner) }.map(&:id)
bar_names.each do |bn|
  Bar.where(name: bn).first_or_create do |bar|
    bar.lat = 50.0 + rand
    bar.lng = 19.0 + rand
    bar.beers << beers.all.sample(rand(1..4))
    BarCreateWithGeolocation.new(bar, User.find(owners.sample)).call!
  end
end
