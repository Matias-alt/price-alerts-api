module Api
  module V1
    class CitiesController < ApplicationController
      require 'json'
      require 'rest-client'

      # GET /cities
      def index
        begin   
          url = 'https://recorrido:recorrido@demo.recorrido.cl/api/v2/es/cities.json?country=chile'
          
          response = RestClient.get url
          result = JSON.parse response.to_str
          p result
          render json: result

        rescue => exception
          p 'ERROR MESSAGE'
          p exception
        end
      end

    end
  end
end
  