class AdminsController < ApplicationController
  def index
    @admins = Mysql::Admin.all
  end
end
