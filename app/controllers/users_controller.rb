# frozen_string_literal: true

# Index and show users
class UsersController < ApplicationController
  def index
    @users = User.all.sort_by(&:username)
  end

  def show
    @user = User.find(params[:id])
  end
end
