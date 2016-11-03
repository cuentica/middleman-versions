require 'middleman-core'

::Middleman::Extensions.register(:versions) do
  require_relative "versions/extension"
  require_relative 'versions/version'
  require_relative 'versions/helpers/file_handler'
  ::Middleman::VersionsExtension
end
