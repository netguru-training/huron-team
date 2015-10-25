class BarDecorator < BaseDecorator

  def name_with_count
    "#{name} (#{beers.count})"
  end

  def street_and_city
    "#{street} #{city}"
  end

end