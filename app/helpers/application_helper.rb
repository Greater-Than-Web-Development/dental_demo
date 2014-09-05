module ApplicationHelper

  def date_formatter(date)

    # \(?<day>\d+)-(?<month>\d+)-(?<year>\d+)\ =~ params[ :birthday ]

    datetime = DateTime.new(day.to_i, month.to_i, year.to_is)
end

end
