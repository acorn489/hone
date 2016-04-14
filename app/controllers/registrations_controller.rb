class RegistrationsController < Devise::RegistrationsController
  #include ApplicationHelper
  after_action :create_languages, only: :create

  def create
    super
  end

  def new
    super
  end

  def languages
    params[:user][:languages].drop(1)
  end

  def update
    super
  end

  private

  def create_languages
    languages.each do |item|
      UserLanguage.create(user_id: @user.id, language: item) if @user.persisted?
    end
  end
end
