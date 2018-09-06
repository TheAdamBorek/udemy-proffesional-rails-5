class PortfolioStorage
  def all
    Portfolio.all
  end

  def update(portfolio, params:)
    portfolio.update params
  end

  def create_portfolio!(params = nil)
    if params.nil?
      Portfolio.new
    else
      portfolio = Portfolio.create params
      did_save = portfolio.save
      throw "Couldn't save a portfolio with params: #{params}" unless did_save
      portfolio
    end
  end

  def find_by_id(id)
    Portfolio.find(id)
  end

  def delete(portfolio)
    portfolio.destroy
  end
end