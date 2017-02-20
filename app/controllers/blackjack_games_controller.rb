class BlackjackGamesController < ApplicationController
  def new
    @game = Blackjack::Game.new
  end

  def show
    @game = Blackjack::Game.all_instances.first
  end

  def hit
    @game = Blackjack::Game.all_instances.first
    @game.hit

    if @game.status[:winner].present?
      redirect_to blackjack_game_path
    end
  end

  def stand
    @game = Blackjack::Game.all_instances.first
    @game.stand

    redirect_to blackjack_game_path
  end
end
