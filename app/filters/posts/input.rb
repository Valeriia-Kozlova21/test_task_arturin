module Posts
  class Input < BaseInput
    attribute :search_text, type: String
    attribute :social_networks, array: true
    attribute :date_from, type: Date
    attribute :date_to, type: Date
  end
end
