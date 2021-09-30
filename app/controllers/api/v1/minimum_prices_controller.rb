module Api
  module V1
    require_relative '../../../drivers/minimum_prices_driver.rb'

    class MinimumPricesController < ApplicationController
      before_action :set_minimum_price, only: [:show, :update, :destroy]

      # GET /minimum_prices
      def index
        @minimum_prices = MinimumPrice.all

        render json: @minimum_prices
      end

      # GET /minimum_prices/1
      def show
        render json: @minimum_price
      end

      # GET /minimum_prices/get_redirect_url
      def get_redirect_url
        if params[:origin].nil? || params[:destiny].nil? || params[:date].nil?
          render json: "Debe incluir como parametro la ciudad de origen, ciudad de destino y fecha de salida"
        end

        origin = params[:origin].downcase!
        destiny = params[:destiny].downcase!
        date = (((params[:date].to_date)).strftime("%d-%m-%Y")).to_s

        @url = "https://demo.recorrido.cl/es/bus/#{origin}/#{destiny}/#{date}"

        render json: {:url => @url}
      end

      # GET /minimum_prices/get_by_alert_id
      def get_by_alert_id
        if params[:alertId].nil? 
          render json: "Debe incluir como parametro el id de alerta de precio"
        end

        id = params[:alertId]

        @minimum_prices = MinimumPrice.where("id_alert_price = #{id}")

        render json: @minimum_prices
      end

      # GET /minimum_prices/get_process
      def get_process
        begin   
          if params[:originId].nil? || params[:destinyId].nil? || params[:travelClass].nil? || params[:departureDate].nil? 
            render json: "Debe incluir como parametro el id de la ciudad de origen y el id de la ciudad de destino"
          end

          originId = params[:originId].to_i
          destinyId = params[:destinyId].to_i
          travelClass = params[:travelClass].to_i
          departureDate = params[:departureDate]

          result = MinimumPricesDriver.minimum_prices_process(originId, destinyId, travelClass, departureDate)

          if !result[:success]
            render json: result
          end

          render json: result

        rescue => exception
          p 'ERROR MESSAGE'
          p exception
        end
      end

      # POST /minimum_prices
      def create
        @minimum_price = MinimumPrice.new(minimum_price_params)

        if @minimum_price.save
          render json: @minimum_price, status: :created, location: @minimum_price
        else
          render json: @minimum_price.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /minimum_prices/1
      def update
        if @minimum_price.update(minimum_price_params)
          render json: @minimum_price
        else
          render json: @minimum_price.errors, status: :unprocessable_entity
        end
      end

      # DELETE /minimum_prices/1
      def destroy
        @minimum_price.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_minimum_price
          @minimum_price = MinimumPrice.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def minimum_price_params
          params.require(:minimum_price).permit(:date, :schedule, :travel_class, :price, :bus_operator, :id_alert_price)
        end
    end
  end
end
