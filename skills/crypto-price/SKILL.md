---
name: crypto-price
description: Query cryptocurrency prices and 24h stats. Use for any crypto price, change percentage, volume queries. Supports BTC, ETH, SOL, BNB, DOGE and all major coins. Uses CoinGecko public API (no API key, no geo restrictions).
metadata: {"openclaw": {"requires": {}}}
---

# Crypto Price Query

Query real-time crypto prices using CoinGecko public API (no API key required, works worldwide).

## Endpoint

GET https://api.coingecko.com/api/v3/simple/price?ids={ID}&vs_currencies=usd&include_24hr_change=true&include_24hr_vol=true&include_market_cap=true

For detailed 24h data:
GET https://api.coingecko.com/api/v3/coins/{ID}?localization=false&tickers=false&community_data=false&developer_data=false

## ID Mapping

- BTC / 比特币 / bitcoin → bitcoin
- ETH / 以太坊 / ethereum → ethereum
- SOL / solana → solana
- BNB → binancecoin
- DOGE / 狗狗币 → dogecoin
- XRP / 瑞波 → ripple
- ADA / 艾达 → cardano
- AVAX → avalanche-2
- MATIC / POL → matic-network
- DOT / 波卡 → polkadot
- LINK → chainlink
- UNI → uniswap
- ATOM → cosmos
- NEAR → near
- APT → aptos
- SUI → sui
- ARB → arbitrum
- OP → optimism

## Steps

1. Map user input to CoinGecko coin ID
2. Call the simple/price endpoint using fetch tool
3. Extract: usd (price), usd_24h_change, usd_24h_vol, usd_market_cap
4. Reply in user's language (Chinese or English)

## Output Format

BTC/USD
价格: $104,250  ▲ +2.15%
24h 成交量: $28.5B
市值: $2.05T
