class CharactersController < ApplicationController
 
 
  def new
    @character = Character.new
  end

  def create
    if current_user
    @character = Character.create(character_params)
    # binding.pry
    # @character.user_id = current_user.id

   

    if @character.save
      redirect_to user_characters_path(@character)
    else 
      render 'new'
    end
  end
  end

  def index
    @characters = Character.all
  end

  def show
    @character = Character.find_by(id: params[:id])
  end

  def destroy
    Character.find(params[:id]).destroy
    redirect_to characters_url
  end

  private

  def character_params
    params.require(:character).permit(:name, :race, :klass)
  end

end
