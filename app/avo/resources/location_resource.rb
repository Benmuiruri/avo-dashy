class LocationResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.default_view_type = :grid
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :description, as: :textarea
  field :photo, as: :file, is_image: true
  field :rooms, as: :has_many
  # add fields here

  grid do
    cover :photo, as: :file, is_image: true, link_to_resource: true
    title :name, as: :text, link_to_resource: true
    body :description, as: :textarea
  end
end
