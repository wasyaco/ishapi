require_dependency "ishapi/application_controller"
module Ishapi
  class EventsController < ApplicationController

    def index
      @events = Event.all
      authorize! :index, Event
      if params[:cityname]
        city = City.find_by :cityname => params[:cityname]
        @events = @events.where( :city => city )
      end
      @events = @events.page( params[:events_page] ).per( 10 )
    end

    def show
      @event = ::Event.unscoped.find_by :eventname => params[:eventname]
      authorize! :show, @event
    end

  end
end
