# ZerodhaKite

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## |> in elixir:  
orders = Order.get_orders(current_user)  
transactions = Transaction.make_transactions(orders)  
payments = Payment.make_payments(transaction, true)  
  
same code using pipeline operator:  
current_user  
|> Order.get_orders  
|> Transaction.make_transactions  
|> Payment.make_payments(true)  

