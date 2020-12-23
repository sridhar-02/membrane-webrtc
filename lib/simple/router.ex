defmodule Example.Simple.Router do
  use Plug.Router

  plug(Plug.Static,
    at: "/",
    from: :example_simple
  )

  plug(:match)
  plug(:dispatch)

  get "/:room" do
    send_file(conn, 200, "priv/static/html/index.html")
  end

  match _ do
    send_resp(conn, 404, "404")
  end
end
