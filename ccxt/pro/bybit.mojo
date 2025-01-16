from ccxt.base.types import *
from ccxt.base.pro_exchangeable import *


struct Bybit(ProExchangeable):
    fn __init__(out self, trading_context: TradingContext):
        pass

    fn set_on_ticker(mut self, on_ticker: OnTicker) raises -> None:
        pass

    fn set_on_tickers(mut self, on_tickers: OnTickers) raises -> None:
        pass

    fn set_on_order_book(mut self, on_order_book: OnOrderBook) raises -> None:
        pass

    fn set_on_trade(mut self, on_trade: OnTrade) raises -> None:
        pass

    fn set_on_balance(mut self, on_balance: OnBalance) raises -> None:
        pass

    fn set_on_order(mut self, on_order: OnOrder) raises -> None:
        pass

    fn set_on_my_trade(mut self, on_my_trade: OnMyTrade) raises -> None:
        pass

    fn subscribe_ticker(
        mut self, symbol: String, params: Dict[String, Any]
    ) raises -> None:
        pass

    fn subscribe_tickers(
        mut self, symbols: Strings, params: Dict[String, Any]
    ) raises -> None:
        pass

    fn subscribe_order_book(
        mut self, symbol: String, params: Dict[String, Any]
    ) raises -> None:
        pass

    fn subscribe_trade(
        mut self, symbol: String, params: Dict[String, Any]
    ) raises -> None:
        pass

    fn subscribe_balance(mut self, params: Dict[String, Any]) raises -> None:
        pass

    fn subscribe_order(
        mut self, symbol: String, params: Dict[String, Any]
    ) raises -> None:
        pass

    fn subscribe_my_trades(
        mut self, symbol: String, params: Dict[String, Any]
    ) raises -> None:
        pass
