## How does the stock market work? 
- Entities:  
People buying shares.
Company giving shares.
The broker acts as the middleman between both of them.
The government makes the rules and regulations.  

- The flow of the stock market:  
  1. People buy shares in the company.
  2. Company issues a certificate. Now the company has got the money. That's it. The company won't be managing these investments the people are making. Now the people become owners of the company.
  3. The people sell the shares in a global/central market. Depending on how the company is doing, they get profit or loss.  
  
## My observations (simulated a stock buying and selling operation in Kite):
1. The system has low latency.
2. The system has to be real-time, i.e the transactions, buying and placing orders, etc all have to be in real-time.
3. The system has to show every change of data/shares in real-time.
4. The system has to support high concurrency. Concurrent users buy and sell shares in real-time, and bids keep changing every second.
5. The system has to show everything graphically using graphs. The User experience should be simple and good.


## The bare minimum features required for the stock market:  
1. User authentication.
2. Stock shares simulation.  
  We can probably integrate an external API or have to see how we can achieve this feature. Implementing the algorithms would also be nice.


## Software options:  
- Backend = Elixir + Phoenix  
- Frontend = Phoenix LiveView OR Flutter  
- Deployment = AWS EC2 instance  
- Database = PostgreSQL?  
- Search = Elastic search OR algorithmic implementation?  
- Caching = Probably not needed  
- Observability = Probably not needed  
- Microservices = Needed for now? Or as Kailash Nadh says, we should grow organically only.


## install elixir and phoenix in ubuntu:  
- wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb
- sudo apt update
- sudo apt install esl-erlang
- sudo apt install elixir
- mix archive.install hex phx_new 
- mix phx.new Zerodha_kite

## docker command pull postgres:  
docker run --name zerodha-kite-db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5500:5432 -d postgres  

## create a table:  
mix phx.gen.context Admin User users name:string email:string:unique role:string address:string income_tax_return:integer photograph:string data_of_birth:date user_id:string:unique  

## Create controller and view to handle request and give response:  
mix phx.gen.json Admin User users name:string email:string:unique role:string address:string income_tax_return:integer photograph:string data_of_birth:date user_id:string:unique --no-context --no-schema  

## Some Decisions 27|12|22:  
- We will leave KYC for now as there are lot of legal procedures involved in this. Use simple user authentication.  
- Focus on local development for now. Production can be done later.  
  ### Focus on
  - How to simulate stock market.
  - How people can buy and sell.

## Research on how to simulate stock market:
- https://github.com/fremantle-industries/tai  
- https://github.com/tolyo/open-outcry  
- https://github.com/stockmarkat/stockmarket-simulation  


## Terminologies:
- Stock market:  
  A stock market, equity market, or share market is the aggregation of buyers and sellers of stocks (also called shares), which represent ownership claims on businesses; 

- Matching engine (Buy and sell):  
  - An order matching system or simply matching system is an electronic system that matches buy and sell orders for a stock market, commodity market or other financial exchange.
  - It is often part of a larger electronic trading system.  
  - Algorithms used:  
    Price/Time algorithm (or **First-in-First-out**). Basically queue.  

- Trading system:  
  is a computer software program that can be used to place orders for financial products over a network



  ## Backend APIs required for stock market trading system:
  1) Stock market simulator:
    - A list of companies will be present in an array. We change the stock prise if them randomnly based on their industry.  
    - This has to be a socket connection as we need to change the data in realtime.

  2) Buy/Sell stock:
    - User buys stock: **(No. of units * stock prise of company at that time)** is deducted from user s account.
    - User sells stock: **(No. of units * stock prise of company at that time)** is added into his account.

  3) User profile:
    - Total money currently present to invest.
    - No. of holdings.  