module ApplicationHelper
  def time_convert(d)
    datetime_object = DateTime.parse(d.to_s)

	time_string = datetime_object.strftime("%I:%M %p")
	time_string
  end
end
