class PortfoliosController < ApplicationController
  before_action :set_portfolio, only [:edit]
  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: "New portfolio was created! :)" }
      end
    end
  end

  def edit

  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end
end
