class SubsController < ApplicationController
    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        # params[:moderator_id]
        @sub.moderator_id = current_user.id
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end

    def update 
        @sub = Sub.find_by(id: params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else    
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        render :show
    end

    def index
        @subs = Sub.all
        render :index
    end

    private 
    def sub_params
        params.require(:sub).permit(:title, :description, :moderater_id)
    end
end
