require "spec_helper"
require_relative '../lib/middleman/versions/helpers/file_handler'

describe "FileHandler" do
  it "load_file method must return a non empty hash from json file" do
    version_hash = Middleman::Versions::FileHandler::load_file(File.join(File.dirname(__FILE__),"../fixtures/directory_with_files/v2.json"))
    expect(version_hash).to include({"swagger" => "2.0"})
  end
  it "load_file method must return a non empty hash from yml file" do
    version_hash = Middleman::Versions::FileHandler::load_file(File.join(File.dirname(__FILE__),"../fixtures/directory_with_files/v1.yml"))
    expect(version_hash).to include({"swagger" => "2.0"})
  end
end
