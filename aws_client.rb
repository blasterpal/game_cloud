require 'fog'

class AwsClient


end


config = YAML.load_file("cloud_config.yml")
@compute = Fog::Compute.new({:provider => 'AWS', :aws_access_key_id => config['aws']['access_key'], :aws_secret_access_key => config['aws']['secret_access_key']})
@storage = Fog::Storage.new({:provider => 'AWS', :aws_access_key_id => config['aws']['access_key'], :aws_secret_access_key => config['aws']['secret_access_key']})
