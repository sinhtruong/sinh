module ApplicationHelper
  def display_long_string(string, max_length)
    if (string.nil? || string.strip.length <= max_length)
      return string
    else
      return string.strip[0..max_length] + "..."
    end
  end
end
