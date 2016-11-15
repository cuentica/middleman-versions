#middleman-versions
Compile different middleman site versions with custom data injected in each one

##Dependencies

* Middleman <= 4.0.0
  
  This Extension use app.proxy to inject values in templates, in Middleman v4 options hash was removed from proxy,        https://github.com/middleman/middleman/blob/7c968b9572923fd0f7fb176ca8e52a91727adf84/CHANGELOG.md


## How to use it
* Add gem to your Gemfile

  ```ruby
  gem 'middleman-versions'
  ```
* Install gems

   ```ruby
   bundle install
   ```

* Edit config.rb and add:

  ```ruby
  activate :versions do |foo|
    #extension configuration params
  end
  ```

## Extension params:
| Param name           | Description                                                | Type                                                                                      | Default value | Mandatory |
|----------------------|------------------------------------------------------------|-------------------------------------------------------------------------------------------|---------------|-----------|
| versions_path        | Directory where we have our data files                     | String                                                                                    | versions/     | Not       |
| versions             | List of files that will be treated as versions files       | Array of:  {:path => "name of file", :decorated_name => "name to be showed in interface"} | Empty         | Yes       |
| origin_template      | Template where will be injected the data readed from files | String                                                                                    | index.html    | Not       |
| destination_template | Name of final compiled file                                | String                                                                                    | index.html    | Not       |

## Injected variables on Template
| Variable name   | Description                         | Type          | Example                                                                                      |
|-----------------|-------------------------------------|---------------|----------------------------------------------------------------------------------------------|
| versions_paths  | List of all versions final paths    | Array[String] | ["v1/index.html", "v2/index.html"]                                                             |
| versions_list   | List of all version decorated names | Array[String] | ["v1","v2"]                                                                                  |
| version_data    | Data readed from version file       | Hash          | {"license"=>{"name"=>"Apache 2.0", "url"=>"http://www.apache.org/licenses/LICENSE-2.0.html"}} |
| current_version | Current version of page itself      | String        | v1                                                                                           |
| current_path    | Current final path of page itself   | String        | v1/index.html                                                                                |
                                                         |
## Compile to static site
When you execute ````middleman build``` you will get a structure like this

```
build
└─── v1
│    │     index.html
│
└─── v2
|    │    index.html
│
└─── resources
          └─── fonts
          └─── images
          └─── javascripts
          └─── stylesheets
```


## TODO:
- [ ] Example Middleman project using this gem
- [ ] Load all files in versions_path and use file name as decorated_name instead of set versions hash
- [ ] Load subdirectories in versions_path as versions and merge all files inside subdirectory as the same version
