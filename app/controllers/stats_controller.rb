class StatsController < ApplicationController
  def index
    @count_by_date = PageView.count_by_date
    @uniq_count_by_date = PageView.uniq_count_by_date
  end
end
