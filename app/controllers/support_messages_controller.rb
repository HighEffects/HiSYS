class SupportMessagesController < ApplicationController
  # GET /support_messages
  # GET /support_messages.json
  
  layout "application"
  
  before_filter :check_access, :except => [:index, :create]
  
  def list
    @support_messages = SupportMessage.all

    respond_to do |format|
      format.html # list.html.erb
      format.json { render json: @support_messages }
    end
  end

  # GET /support_messages/1
  # GET /support_messages/1.json
  def show
    @support_message = SupportMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @support_message }
    end
  end

  # GET /support_messages/new
  # GET /support_messages/new.json
  def index
    @support_message = SupportMessage.new

    respond_to do |format|
      format.html { render :layout => "layout-contact" }# new.html.erb
      format.json { render json: @support_message }
    end
  end

  # POST /support_messages
  # POST /support_messages.json
  def create
    @support_message = SupportMessage.new(params[:support_message])
    if user_signed_in?
      @support_message.user_id = current_user.id
      @support_message.email = current_user.email
    end
    respond_to do |format|
      if @support_message.save
        # Create mixpanel user and track signup event
        if Rails.env.production?
          mixpanel.track 'Support Message', { :distinct_id => current_user.id }
        end
        #Send Welcome email to user
        UserMailer.support_message(@support_message).deliver
        format.html { redirect_to({action: "index"}, {notice: t("support_messages.message_sent") }) }
        format.json { render json: @support_message, status: :created, location: @support_message }
      else
        format.html { render action: "index" }
        format.json { render json: @support_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /support_messages/1
  # DELETE /support_messages/1.json
  def destroy
    @support_message = SupportMessage.find(params[:id])
    @support_message.destroy

    respond_to do |format|
      format.html { redirect_to support_messages_url }
      format.json { head :no_content }
    end
  end
  
  def check_access
    if user_signed_in? == false
      redirect_to(new_user_session_path, alert: 'You dont have access to that page!')
    end
  end
  
end
