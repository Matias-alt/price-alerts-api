require 'active_support/core_ext'

class MinimumPricesDriver
    
    def self.minimum_prices_process(departureCityId, destinationCityId, travelClass, departureDate)

        result_data = []
        valid = 0
        while true
            if valid > 7
                break
            end

            date = (((departureDate.to_date)+valid).strftime("%d-%m-%Y")).to_s
            result = create_search(departureCityId, destinationCityId, travelClass, date)

            if !result[:success]
                return result 
            end
            
            result_data.append(result[:data])

            valid += 1
        end

        return {:success => true, :data => result_data}
    end

    def self.create_search(departureCityId, destinationCityId, travelClass, departureDate)
        #CREATE SEARCH
        url = 'https://recorrido:recorrido@demo.recorrido.cl/api/v2/es/bus_travels.json'
        response = RestClient.post url, {
                                "bus_travel": {
                                    "departure_city_id": departureCityId, 
                                    "destination_city_id": destinationCityId, 
                                    "departure_date": departureDate}}.to_json, 
                                    :content_type => "application/json"    
                                                            
        result = JSON.parse response.to_str
        result = result.symbolize_keys()

        search_id = result[:id]
        pollingUrl = result[:search_progres_url]
        pollingUrl = pollingUrl.gsub('https://', '')
        pollingUrl = "https://recorrido:recorrido@#{pollingUrl}"

        #POLLING
        valid = false
        while !valid
            response = RestClient.get pollingUrl
            result = JSON.parse response.to_str
            result = result.symbolize_keys()

            if result[:progress_status] == 'complete'
                valid = true
            end
        end

        #SEARCH RESULTS
        url = "https://recorrido:recorrido@demo.recorrido.cl/api/v2/es/bus_travels/#{search_id}/search_results.json"
        response = RestClient.get url                        
        search_results = JSON.parse response.to_str
        search_results = search_results.symbolize_keys()
        search_results = search_results[:outbound].symbolize_keys()
        price_results = []

        if search_results[:search_results].empty?
            return {:success => false, :msg => 'no results were found with the date entered'}
        end
    
        #All the prices of the result are added to then fin the lowest
        search_results[:search_results].each do |sr|
            if sr["seat_klass_stars"] == travelClass
                price_results.append(sr["price"])
            end
        end

        #The lowest price is found and an object is created with the data to be returned
        minimum_price = price_results.min
        result_data = {}
        search_results[:search_results].each do |sr|
            if sr["price"] == minimum_price
                result_data["date"] = sr["departure_time"].to_date
                result_data["schedule"] = Time.parse(sr["departure_time"]).strftime("%H:%M")
                result_data["travelClass"] = sr["seat_klass"] 
                result_data["price"] = sr["price"].to_i
                result_data["busOperator"] = sr["bus_operator_name"]
                break
            end
        end

        return {:success => true, :data => result_data}
    end
end