class PortfoliosController < ApplicationController
  before_action :create_storage
  before_action :find_portfolio, only: [:show, :edit, :update, :destroy]

  def index
    @portfolios = @storage.all
  end

  def show
    @page_title = @portfolio.title
  end

  def new
    @portfolio = @storage.create_portfolio!
    3.times { @portfolio.technologies.build }
  end

  def create
    @portfolio = @storage.create_portfolio!(portfolio_params)
    respond_to do |format|
      format.html { redirect_to portfolio_path @portfolio }
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @storage.update(@portfolio, params: portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Did change the portfolio #{@portfolio.id}" }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @storage.delete @portfolio
        format.html { redirect_to portfolios_path, notice: "Portfolio #{@portfolio.title} was deleted!" }
      end
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name])
  end

  def find_portfolio
    @portfolio = @storage.find_by_id params[:id]
  end

  def create_storage
    @storage = PortfolioStorage.new
  end
end
