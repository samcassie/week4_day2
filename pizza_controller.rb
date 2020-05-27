require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza_order.rb')
also_reload('./models')

get '/pizza-orders' do
    @orders = PizzaOrder.all()
    erb(:index)
end

get '/pizza-orders/new' do
    erb(:new)
end

get '/pizza-orders/:id' do
    id = params[:id]
    @order = PizzaOrder.find(id)
    erb(:show)
end

get '/pizza-orders/:id/edit' do
    id = params[:id]
    @order = PizzaOrder.find(id)
    erb(:edit)
end

post '/pizza-orders/:id/update' do
    # id = params[:id]
    @order = PizzaOrder.new(params)
    @order.update()
    erb(:update)
end

post '/pizza-orders/:id/delete' do
    id = params[:id]
    @order = PizzaOrder.find(id)
    @order.delete()
    erb(:delete)
end

post '/pizza-orders' do
    @order = PizzaOrder.new(params)
    @order.save()
    erb(:create)
end
