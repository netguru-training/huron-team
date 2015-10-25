beer_names = ["Guiness", "Smithwicks", "Imperial Stout Porter", "Frater", "Pilzner Urquell", "Carlsberg"]
beer_kinds = %w[Stout Ale Porter Pszeniczne Pilzner Lager]

beer_names.each_with_index do |bn, i|
  Beer.where(name: bn).first_or_create do |b|
    b.kind = beer_kinds[i]
  end
end

beers = Beer.all

bar_names = ["Kontynuacja", "Biała Małpa", "Złoty Osioł", "Niebo", "Kocioł", "Browariat"]
bar_names.each do |bn|
  Bar.where(name: bn).first_or_create do |bar|
    bar.lat = 50.0 + rand
    bar.lng = 19.0 + rand
    bar.beers << beers.all.sample(rand(1..4))
    BarCreateWithGeolocation.new(bar).call!
  end
end
