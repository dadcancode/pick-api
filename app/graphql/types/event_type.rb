module Types
  class EventType < Types::BaseObject
    field :strEvent, String, null: false
    field :strHomeTeam, String, null: false
    field :strAwayTeam, String, null: false
    field :intHomeScore, String, null: false
    field :intAwayScore, String, null: false
    field :dateEvent, String, null: false
  end
end
