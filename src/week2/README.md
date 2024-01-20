# 本週題目

用 HackMD 繳交作業。如不做進階題可留空白，繳交作業時，請提供 HackMD網址

## 基礎

1. 部署自己的 AMM 合約

    - 開源並提交合約地址
    - 實作 swap, addLiquidity, removeLiquidity 提交截圖並說明各操作

2. 親身體驗 DeFi，選擇兩個前 20 大的 DeFi 協議操作，並詳細說明該協議的功能及特色

    - 提交交易的 Tx hash 以及協議地址
    - 寫下詳細的操作過程，例如：使用 Uniswap 將 0.1 ETH 換成 … DAI
    - 說明該操作使用協議中智能合約的哪些 function 並說明其中程式碼共做了哪些鏈上狀態改變

## 進階

1. 實作一個整合 DeFi 協議的智能合約。例如串接 Uniswap 的 Router 將 tokenA 換成 tokenB 或串接 Aave 抵押 tokenA 借出 tokenB …等等

    - 描述該合約的功能以及串接哪個 DeFi 協議
    - 使用 foundry or hardhat 完成測試確認成功串接合約
