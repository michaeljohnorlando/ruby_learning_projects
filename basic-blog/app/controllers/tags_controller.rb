class TagsController < ApplicationController
    def show
        @tag = Tag.find(params[:id])
    end
    def index
        @tags = Tag.all
    end
    def destroy
        Tag.find(params[:id]).destroy
        
        flash.notice = "you deleted a tag!   hope you meant to..."
        redirect_to articles_path
    end
end
