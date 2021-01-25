module Types
  class LeagueType < Types::BaseObject
    field :seasons, [Types::BasicseasonType], null: false
  end
end
