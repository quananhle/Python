import pandas as pd
import numpy as np

def get_most_volatile(prices):
    """Return the ticker symbol for the most volatile stock.
    
    Parameters
    ----------
    prices : pandas.DataFrame
        a pandas.DataFrame object with columns: ['ticker', 'date', 'price']
    
    Returns
    -------
    ticker : string
        ticker symbol for the most volatile stock
    """
    # TODO: Fill in this function.
    prices_list = []
    prices = prices.set_index('date')
    for ticker in prices.ticker.unique():
        ticker_price = prices[prices['ticker'] == ticker]['price'] 
        ticker_lret  = np.log(ticker_price/ticker_price.shift(1))
        ticker_std_ = ticker_lret.std() 
        print ("Standard deviation of ticker " + ticker + ": ", ticker_std_)
        prices_list.append(ticker_std_)
    prices_list = pd.Series(prices_list)
    prices_list.index = prices.ticker.unique()
    ticker = prices_list.idxmax()

    for ticker in prices.ticker:
        price_A_ = prices[prices['ticker'] == 'A']['price']
        lret_A_  = np.log(price_A_/price_A_.shift(1))
        ticker_A_ = lret_A_.std() 
        price_B_ = prices[prices['ticker'] == 'B']['price']
        lret_B_  = np.log(price_B_/price_B_.shift(1))
        ticker_B_ = lret_B_.std() 
    print ("Standard deviation of ticker A: ", ticker_A_)
    print ("Standard deviation of ticker B: ", ticker_B_)
    
    return ticker
    
    # if ticker_A_ < ticker_B_:
    #     return 'B'
    # return 'A'
    
def test_run(filename='prices.csv'):
    """Test run get_most_volatile() with stock prices from a file."""
    prices = pd.read_csv(filename, parse_dates=['date'])
    print("Most volatile stock: {}".format(get_most_volatile(prices)))


if __name__ == '__main__':
    test_run()
