# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  require 'yaml'

  def take_yaml(yaml)
  	@data = YAML.load(yaml)
  end

  def to_yaml
    @data.to_yaml
  end

end