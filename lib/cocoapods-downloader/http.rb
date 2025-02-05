require 'cocoapods-downloader/remote_file'

module Pod
  module Downloader
    class Http < RemoteFile
      private

      executable :curl

      def download_file(full_filename)
        parameters = ['-f', '-L', '-o', full_filename, url, '--create-dirs', '--netrc-optional', '--retry', '2']

        http_headers.each do |h|
          parameters << '-H'
          parameters << h
        end unless http_headers.nil?

        curl! parameters
      end
    end
  end
end
