module Mysql
	class Base < ActiveRecord::Base
		#database = YAML.load(ERB.new(File.read('config/mysql/database.yml')).result)
		establish_connection("mysql_#{Rails.env}".to_sym)
		self.abstract_class = true
	end
end
