module Api
  module V1
    class PriceAlertsController < ApplicationController
      before_action :set_price_alert, only: [:show, :update, :destroy]
    
      # GET /price_alerts
      def index
        @price_alerts = PriceAlert.all
    
        render json: @price_alerts
      end
    
      # GET /price_alerts/1
      def show
        render json: @price_alert
      end
    
      # POST /price_alerts
      def create
        p "AQUI ESTAMOSSSS"
        @price_alert = PriceAlert.new(price_alert_params)
    
        if @price_alert.save
          render json: @price_alert, status: 200
        else
          render json: @price_alert.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /price_alerts/1
      def update
        if @price_alert.update(price_alert_params)
          render json: @price_alert
        else
          render json: @price_alert.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /price_alerts/1
      def destroy
        @price_alert.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_price_alert
          @price_alert = PriceAlert.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def price_alert_params
          params.require(:price_alert).permit(:name, :origin, :destiny, :travelClass, :price, :departure_date)
        end
    end
  end
end



