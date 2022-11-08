module OutputColor
  def highlight(string)
    puts "\n"
    puts string.blue
  end

  def error(string)
    puts "\n"
    puts string.red
  end
end