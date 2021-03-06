######################################################################
# Args - Formats and returns user input arguments appropriately.
# Author: Nevin Jojo
######################################################################

class Args

  # Returns the WebDriver based on the browser option selected by the user.
  #
  # Default Browser: Chrome
  # @return [driver]
  def get_driver
    case ARGV[0]
    when 'chrome'
      return Selenium::WebDriver.for :chrome
    when 'firefox'
      return Selenium::WebDriver.for :firefox
    when 'iexplorer'
      return Selenium::WebDriver.for :ie
    when 'safari'
      return Selenium::WebDriver.for :safari
    else
      return Selenium::WebDriver.for :chrome
    end
  end

  # Returns the list of filenames in a directory / subdirectories
  #
  # @return [String] files
  def get_files
    if ARGV[1].include? ".txt"
      files = [] << ARGV[1]
    else
      files = Dir.glob(ARGV[1] + "/**/*.txt")
    end
    return files
  end

  def get_results_directory
    return ARGV[2]
  end

  def get_stats_directory
    if ARGV[3].include? ".txt"
      files = [] << ARGV[3]
    elsif ARGV[3].include? "current"
      files = "current"
    else
      files = Dir.glob(ARGV[3] + "/**/*.txt")
    end
    return files
  end
end