class FutureBookings < Avo::Filters::BooleanFilter
  self.name = "Future bookings"
  # self.visible = -> do
  #   true
  # end

  def apply(request, query, values)
   if values['future'].present?
     return query.where('booked_at > ?', Time.now)
   else
     query
   end
  end

  def options
    {
      future: 'Only Future bookings',
    }
  end
end
