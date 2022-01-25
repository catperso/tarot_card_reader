class CardsController < ApplicationController

  def index
    @cards = Card.all
    render :index
  end

  def new
    @card = Card.new
    render :new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to cards_path
    else
      render :new
    end
  end

  def edit
    @card = Card.find(params[:id])
    render :edit
  end

  def show
    @card = Card.find(params[:id])
    render :show
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      redirect_to cards_path
    else
      render :edit
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to cards_path
  end

  def three
    @cards = Card.all.shuffle
    @three = @cards.slice(0,3)
    render :three
  end

  def ten
    @cards = Card.all.shuffle
    @ten = @cards.slice(0,10)
    render :ten
  end

  def random
    @card = Card.all.sample
    render :random
  end

  private
    def card_params
      params.require(:card).permit(:name, :description, :image)
    end
end