class BooksController < ApplicationController
  before_action :authenticate_admin!
  def index
  end

  def new
    @book = Book.new
  end

  def create

  end

  def edit
  end

  def update
    
  end

  def destroy
    
  end

end
