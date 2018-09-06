class PortfoliosController < ApplicationController
  before_action :find_portfolio, only: [:show, :edit, :update, :destroy]

  def index
    @portfolios = Portfolio.all
  end

  def show
  end

  def new
    @portfolio = Portfolio.new
    3.times { @portfolio.technologies.build }
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

  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Did change the portfolio #{@portfolio.id}" }
      end
    end
  end

  def destroy
    respond_to do | format |
      if @portfolio.destroy
        format.html { redirect_to portfolios_path, notice: "Portfolio #{@portfolio.title} was deleted!"}
      end
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
  end

  def find_portfolio
    @portfolio = Portfolio.find(params[:id])
  end
end
