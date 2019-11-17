class ParticipantsController < ApplicationController
  def index
    @participants = Participant.all
  end

  def show
    @participant = Participant.find(params[:id])
  end

  def new
    @group = Group.find(params[:group_id])
    @participant = Participant.new
  end

  def create
    @group = Group.find(params[:group_id])
    @participant = Participant.new(participant_params)

    @participant.admin = true if @group.participants.empty?

    @participant.group = @group

    if @participant.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:first_name, :last_name, :email, :group_id)
  end
end
