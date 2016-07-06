class InviteController < ApplicationController
  def index
    if current_user

    end
  end

  def create
    redirect_to root_path if current_user == nil
    target_user = User.find_by(id: params["target_id"])
    sending_user = User.find_by(id: current_user.id)

    is_duplicate = Invite.where(sender_id: current_user.id, user_id: target_user.id)
    invite = Invite.new(pantry_id: current_user.pantry_id, user_id: target_user.id, sender_id: sending_user.id, request: false)
    if invite.save && (is_duplicate.count == 0)
      redirect_to "/user/#{current_user.id}/invite"
    end
    flash[:notice] = "Invited Already."
    redirect_to user_path(current_user)
  end

  def destroy
  end
end
