from .types import *


# 定义 ProExchangeable 接口
trait ProExchangeable:
    fn set_on_ticker(mut self: Self, on_ticker: OnTicker) raises -> None:
        ...

    fn set_on_tickers(mut self: Self, on_tickers: OnTickers) raises -> None:
        ...

    fn set_on_order_book(
        mut self: Self, on_order_book: OnOrderBook
    ) raises -> None:
        ...

    fn set_on_trade(mut self: Self, on_trade: OnTrade) raises -> None:
        ...

    fn set_on_balance(mut self: Self, on_balance: OnBalance) raises -> None:
        ...

    fn set_on_order(mut self: Self, on_order: OnOrder) raises -> None:
        ...

    fn set_on_my_trade(mut self: Self, on_my_trade: OnMyTrade) raises -> None:
        ...

    fn subscribe_ticker(
        mut self, symbol: String, params: Dict[String, Any]
    ) raises -> None:
        ...

    fn subscribe_tickers(
        mut self, symbols: Strings, params: Dict[String, Any]
    ) raises -> None:
        ...

    fn subscribe_order_book(
        mut self, symbol: String, params: Dict[String, Any]
    ) raises -> None:
        ...

    fn subscribe_trade(
        mut self, symbol: String, params: Dict[String, Any]
    ) raises -> None:
        ...

    fn subscribe_balance(mut self, params: Dict[String, Any]) raises -> None:
        ...

    fn subscribe_order(
        mut self, symbol: String, params: Dict[String, Any]
    ) raises -> None:
        ...

    fn subscribe_my_trades(
        mut self, symbol: String, params: Dict[String, Any]
    ) raises -> None:
        ...
