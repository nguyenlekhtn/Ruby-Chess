require 'fileutils'

module SaveLoad
  SAVE_PATH = 'save/'.freeze
  PREFIX = 'save_'.freeze

  def save(game)
    puts 'Saving ...'
    file_name = create_save_name
    file_path = "#{SAVE_PATH}#{file_name}"
    FileUtils.mkdir_p(SAVE_PATH)
    File.open(file_path, 'w+') do |file|
      JSON.dump(game, file)
    end

    puts "File saved successfully to #{file_path}"
  end

  def create_save_name
    time = Time.new
    formatted_time = time.strftime('%Y:%m:%d %H:%M:%S')
    "#{PREFIX}#{formatted_time}"
  end

  def load
    puts 'Getting all available save states'
    save_files = Dir.glob("#{PREFIX}*", base: SAVE_PATH)

    if save_files.empty?
      puts "No save file to load.\n New game is ready"
      return
    end
    puts list_with_index(save_files)
    file_name = get_file_name_from_list(save_files)

    if file_name == 'New game'
      puts 'New game is ready'
      return
    end

    load_path = "#{SAVE_PATH}#{file_name}"
    JSON.load_file(load_path, create_additions: true)
  end

  def list_with_index(list)
    list.map.with_index do |item, index|
      "#{index + 1}: #{item}\n"
    end.join
  end

  def get_file_name_from_list(list)
    puts 'Please enter the number of the save state, or 0 to play new game'
    loop do
      ordinal_number = gets.chomp.to_i
      return 'New game' if ordinal_number.zero?
      return list[ordinal_number - 1] if (1..list.length).include? ordinal_number

      puts 'Please enter a valid number'
    end
  end
end
