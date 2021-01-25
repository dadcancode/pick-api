module Types
  class SeasonType < Types::BaseObject
    field :events, [Types::EventType], null: false
  end
end
