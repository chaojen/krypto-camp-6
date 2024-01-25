# 本週題目

## 基礎

1. 部一個ERC721的合約，寫一個typescript/javascript，運用ethers，完成

    - A錢包Mint並Approve 該NFT 給B地址。
    - B地址轉移該NFT到C地址。

2. 用ethers實作一個掏空某錢包地址的ETH的程式

3. 部署一個ERC20，用ethers實作一個掏空該ERC20的程式

## 進階

1. 研究Flashbot，並試著將兩筆交易打包在同一個區塊中。

    - A錢包部署NFT合約，實作setBaseURI (onlyOwner)
    - 將以下兩個交易打包成同一個區塊上鏈：
    - B錢包打錢到A錢包
    - A錢包設定setBaseURI
