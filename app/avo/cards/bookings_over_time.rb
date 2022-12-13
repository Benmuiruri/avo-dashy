class BookingsOverTime < Avo::Dashboards::ChartkickCard
  self.id = "bookings_over_time"
  self.label = "Bookings over time"
  self.chart_type = :area_chart
  # self.description = "Some tiny description"
  self.cols = 3
  # self.initial_range = 30
  # self.ranges = {
  #   "7 days": 7,
  #   "30 days": 30,
  #   "60 days": 60,
  #   "365 days": 365,
  #   Today: "TODAY",
  #   "Month to date": "MTD",
  #   "Quarter to date": "QTD",
  #   "Year to date": "YTD",
  #   All: "ALL",
  # }
  # self.chart_options = { library: { plugins: { legend: { display: true } } } }
  # self.flush = true

  def query
    points = 16
    i = Time.new.year.to_i - points
    base_data = Array.new(points).map do
      i += 1
      [i.to_s, rand(0..20)]
    end.to_h

    # get results from user booking count
    bookings = Booking.all
    bookings_by_year = bookings.group_by { |booking| booking.booked_for.year }
    bookings_by_year.each do |year, bookings|
      base_data[year.to_s] = bookings.count
    end

    result base_data
  end
end
