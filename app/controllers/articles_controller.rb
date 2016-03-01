class ArticlesController < ApplicationController
  def index
  end

  def show
    session['id'] = params[:id]
    page = "<body>hello</body"
    render text: page
  end

  def update

  end

  def create

  end
end
