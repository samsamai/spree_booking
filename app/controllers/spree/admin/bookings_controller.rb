require 'table_builder'

module Spree
  module Admin
    class BookingsController < Spree::Admin::BaseController

      def show
        @line_items = Spree::LineItem.where.not(bus_booking_id: 'NULL')
        @bus_bookings = BusBooking.all
        @date = params[:month] ? Date.strptime(params[:month], "%Y-%m") : Date.today
        @buses = Bus.all
      end

      def create
      end

      def update
      end
      
      def destroy
      end

      private
      def model_class
        Spree::Admin::BookingsController
      end
      
      def booking_params
        params.require(:booking).permit(:month)
      end
    end
  end
end


