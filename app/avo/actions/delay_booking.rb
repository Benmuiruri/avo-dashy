class DelayBooking < Avo::BaseAction
  self.name = 'Delay booking'
  # self.visible = -> do
  #   true
  # end

  def handle(**args)
    models, fields, current_user, resource = args.values_at(:models, :fields, :current_user, :resource)

    number_of_hours = fields['number_of_hours'].to_i

    models.each do |model|
      # Do something with your models.
      model.booked_at = model.booked_at + number_of_hours.hour
      model.save
    end
  end

  field :number_of_hours, as: :number, placeholder: 'Hours', default: 1, help: 'Number of hours to delay the booking'
end
