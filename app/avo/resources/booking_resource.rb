class BookingResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :room_id, as: :number
  field :user_id, as: :number
  field :booked_at, as: :datetime
  field :booked_for, as: :number
  field :room, as: :belongs_to
  field :user, as: :belongs_to
  # add fields here
end
