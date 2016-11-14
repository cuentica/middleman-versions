module Middleman
  class VersionsExtension < ::Middleman::Extension
    option :versions_path, 'versions/', 'Directory path where we search the versions'
    option :versions, [], 'Array of hashes, {:path => "name of file", :decorated_name => "name to be showed in interface"}'
    option :origin_template, 'index.html', 'Template where data will be inserted the data'
    option :destination_template, 'index.html', 'Compiled template name'

    def initialize(app, options_hash={}, &block)
      super
    end


    def after_configuration
      app.config[:versions_options] = options
      versions_list = options.versions.map{|x| x[:decorated_name]}
      versions_paths = options.versions.map{|x| x[:decorated_name] + "/" + options.destination_template}

      options.versions.each do |version|
        full_version_path = options.versions_path + version[:path]
        version_data = Versions::FileHandler::load_file(full_version_path)
        current_path = "#{version[:decorated_name]}/#{options.destination_template}"

        app.proxy "#{current_path}", "/#{options.origin_template}",
        :locals => {
          :versions_paths => versions_paths,
          :versions_list => versions_list,
          :version_data => version_data ,
          :current_version => version[:decorated_name],
          :current_path => "#{current_path}"
          },
        :ignore => true
      end
    end
  end
end
