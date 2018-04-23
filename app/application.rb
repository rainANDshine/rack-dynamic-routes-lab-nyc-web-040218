class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path == "/items"
      #if req.path.match(/items/)

      item_title = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_title}
      resp.write item || item.price
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
