module Middleman
  module Versions
    module FileHandler
      def self.load_file(path)
        case File.extname(path)
          when ".yml",".yaml"
            load_yaml_file path
          when ".json"
            load_json_file path
        end
      end

      private_class_method def self.load_yaml_file(path)
        require 'yaml'
        YAML::load(File.open(path))
      end

      private_class_method def self.load_json_file(path)
        require 'json'
        JSON.parse( IO.read(path))
      end
    end
  end
end
