# frozen_string_literal: true

class TagsController < ApplicationController
  # Protect delete tags action from unauthenticated users
  before_action :require_login, only: [:destroy]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    flash.notice = "Tag '#{@tag.name}' Deleted!"

    redirect_to tags_path
  end
end
