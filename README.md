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
