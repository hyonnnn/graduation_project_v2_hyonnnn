class HomeController < ApplicationController
  # index アクションはログイン不要
  skip_before_action :authenticate_user!, only: [:index]

  def index
  end
end
