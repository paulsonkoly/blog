module BlogpostsHelper
  def human_date(date)
    "#{date.day}/#{date.month}/#{date.year}"
  end
end
