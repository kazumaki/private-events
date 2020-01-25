class InvitesController < ApplicationController
  def new
    @invite = Invite.new
    @event = Event.find_by(id: params[:event_id])
    redirect_to @event unless @event.creator == current_user
  end

  def create
    invited_user = User.find_by(id: params[:invite][:attendee_id])
    event = Event.find_by(id: params[:invite][:event_id])
    if invited_user && event
      invite = event.invites.build(attendee_id: invited_user.id)
      if invite.save
        redirect_to event
      else
        @invite = Invite.new
        @event = Event.find_by(params[:invite][:event_id])
        render 'new'
      end
    else
      @invite = Invite.new
      @event = Event.find_by(params[:invite][:event_id])
      render 'new'
    end
  end
end
