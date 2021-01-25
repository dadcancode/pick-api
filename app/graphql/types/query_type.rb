module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :baseseasons, [Types::BasicseasonType], null: false

    def baseseasons
      find_base_seasons("4391")
    end

    field :season, Types::SeasonType, null: false do
      argument :year, String, required: true
    end

    def season(year:)
      get_season_by_id(year)
    end

    
  end
end

private

NFL_SEASON_ID = "4391"
BASE_URL = "https://www.thesportsdb.com/api/v1/json/1/"
SEASONS_BY_LEAGUEID = "search_all_seasons.php?id="
EVENTS_BY_SEASON_YEAR = "eventsseason.php?id=#{NFL_SEASON_ID}&s="

def request_api(url)
  response = Excon.get(url)

  return nil if response.status != 200

  JSON.parse(response.body)
end

def find_base_seasons(leagueID)
  data = request_api("#{BASE_URL}#{SEASONS_BY_LEAGUEID}#{leagueID}")

  data["seasons"]
end

def get_season_by_id(seasonID)
  data = request_api("#{BASE_URL}#{EVENTS_BY_SEASON_YEAR}#{seasonID}")

  data
end
