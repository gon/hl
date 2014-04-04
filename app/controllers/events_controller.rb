class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  # GET /events.js
  def index
    #@events = Event.paginate(:page => params[:page])
    page = params[:page] ? params[:page].to_i : 0

    @@total_count ||= JSON.parse(RestClient.get("http://hackerleague.org/api/v1/hackathons.json")).count
    response = JSON.parse(RestClient.get("http://hackerleague.org/api/v1/hackathons.json?limit=#{Event.per_page}&offset=#{page}")).map!{|event| Hashie::Mash.new event }
    @events = response.map{|event_attrs| Event.build_with_hackerleague event_attrs }

    respond_to do |format|
      format.html { render locals: {next_page: (page + 1)} }
      format.json { render json: @events }
      format.js { render locals: {next_page: (page + 1)} }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def entry_params
    params.require(:event).permit(:title)
  end
end
