---
name: binance-price
description: Query cryptocurrency prices and 24h stats from Binance public API. Use for any crypto price, change percentage, volume queries. Supports BTC, ETH, SOL, BNB, DOGE and all coins listed on Binance.
metadata: {"openclaw": {"requires": {}}}
---

# Binance Price Query

Query real-time crypto prices using Binance public API (no API key required).

## Endpoint

GET https://api.binance.com/api/v3/ticker/24hr?symbol={SYMBOL}

Symbol format: uppercase base + USDT. Examples: BTCUSDT, ETHUSDT, SOLUSDT

## Symbol Mapping

- BTC / 比特币 / bitcoin → BTCUSDT
- ETH / 以太坊 / ethereum → ETHUSDT
- SOL / solana → SOLUSDT
- BNB → BNBUSDT
- DOGE / 狗狗币 → DOGEUSDT
- XRP / 瑞波 → XRPUSDT

## Steps

1. Map user input to Binance symbol
2. Call the endpoint using fetch tool
3. Extract: lastPrice, priceChangePercent, highPrice, lowPrice, quoteVolume
4. Reply in user's language (Chinese or English)

## Output Format

BTC/USDT
价格: $104,250  ▲ +2.15%
24h 最高/最低: $105,100 / $101,800
24h 成交额: $1.28B
