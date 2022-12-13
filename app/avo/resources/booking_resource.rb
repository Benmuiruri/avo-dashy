class BookingResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :booked_at, as: :date_time
  field :booked_for, as: :select, options: {
    '1 hour' => 1,
    '2 hours' => 2,
    '3 hours' => 3,
  }
  field :room, as: :belongs_to
  field :user, as: :belongs_to, default: -> { Avo::App.context[:current_user]}
  # add fields here

  filter FutureBookings
end
