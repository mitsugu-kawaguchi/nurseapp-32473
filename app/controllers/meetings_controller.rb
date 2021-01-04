class MeetingsController < ApplicationController

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to root_path, notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def meeting_params
      params.require(:meeting).permit(:name, :start_time)
    end
end
