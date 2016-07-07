class InviteController < ApplicationController
  def index
    if current_pantry
      @requests = current_pantry.invites.where(request: true)
      @sent_invites = current_pantry.invites.where(request: false)
    else
      @requests = nil
      @sent_invites = nil
    end
    @invites = Invite.where(user_id: current_user.id)
  end

  def create
    redirect_to root_path if current_user == nil
    target_user = User.find_by(id: params["target_id"])
    sending_user = User.find_by(id: current_user.id)

    #Check if there is a duplicate invite
    is_duplicate = Invite.where(sender_id: current_user.id, user_id: target_user.id)

    #Creating new Invite
    invite = Invite.new(pantry_id: current_user.pantry_id, user_id: target_user.id, sender_id: sending_user.id, request: false)
    puts "************"
    puts is_duplicate
    puts is_duplicate.count
    if is_duplicate.count > 0
      flash[:notice] = "Invited Already."
      redirect_to "/user/#{current_user.id}/invite"
    elsif invite.save
      puts "Invited Created Successfully"
      flash[:notice] = "#{target_user.first_name} Successfully Invited"
      redirect_to "/user/#{current_user.id}/invite"
    else
      flash[:notice] = "Something went wrong."
      redirect_to user_path(current_user)
    end
  end

  def destroy
    Invite.delete(params[:id])
    flash[:notice] = "Invite Deleted."
    redirect_to "/user/#{current_user.id}/invite"
  end
end
