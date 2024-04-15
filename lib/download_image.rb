# frozen_string_literal: true

require "fileutils"
require "open-uri"

class DownloadImage
  def initialize(date, resolution, link)
    @date = date
    @resolution = resolution
    @link = link
  end

  # rubocop:disable Security/Open
  # Due to https://github.com/ruby/open-uri/commit/53862fa35887a34a8060aebf2241874240c2986a
  def perform
    check_download_folder

    URI.open(@link) do |image|
      File.open("#{download_path}/#{image_name}", "wb") do |file|
        file.write(image.read)
      end
    end
  end
  # rubocop:enable Security/Open

  private

  def check_download_folder
    FileUtils.mkdir_p(download_path)
  end

  def download_path
    "#{Dir.pwd}/downloads/#{@date}/#{@resolution}"
  end

  def image_name
    File.basename(@link)
  end
end
