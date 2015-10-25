class BarDecorator < BaseDecorator

  def name_with_count
    "#{bar.name} (#{bar.beers.count})"
  end

  def street_and_city
    "#{bar.street} #{bar.city}"
  end

end