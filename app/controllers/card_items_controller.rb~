class CardItemsController < ApplicationController
  layout 'main_layout', :only =>'index'

	def create
		id = rand(1234567890)
    session[:card] = Card.new( :id => id) unless session[:card]
    session[:card][:card_item] = {} unless session[:card][:card_item]
    idItem = 0
    @product = Product.find(params[:product_id])
    count = 1
    session[:card][:card_item].each do |item, item_params|
			if item_params[:product_id] == @product.id
				count = item_params[:count] + 1
				idItem = item.to_i #item_params[:id]
			end
    end
    idItem = rand(1234567890) if idItem == 0
    session[:card][:card_item][idItem] = {:product_id=>@product.id, :count=>count, :price=>@product.price, :summ=>@product.price*count}
    session[:card].count = session[:card][:card_item].size
  end

  def index
  	if session[:card]
	    #@card_items = []
	    #session[:card][:card_item].each do |item, item_params|
	    #	@card_items << CardItem.new(
	    #												:id=>item_params[:id], #item.to_i,
	    #												:product_id=>item_params[:product_id],
	    #												:count=>item_params[:count],
	    #												:price=>item_params[:price])
	    #end
	  else
	  	@card_items = nil
	  end
  end

	def card_clear
		if params[:id]
			current_card[:card_item].delete(params[:id].to_i)
			current_card.count -= 1
			session[:card] = nil if current_card.count == 0
		else
			session[:card] = nil
		end
		redirect_to(card_items_url)
	end

	def card_conversion
		product_id = session[:card][:card_item][params[:id].to_i][:product_id]
		count = session[:card][:card_item][params[:id].to_i][:count]
		price = session[:card][:card_item][params[:id].to_i][:price]
		if params[:act] == 'true'
			count += 1
			summ = count * price
			session[:card][:card_item][params[:id].to_i] = {
															:product_id=>product_id,
															:count=>count,
															:price=>price,
															:summ=>summ}
		else
			count -= 1
			if count == 0
				current_card[:card_item].delete(params[:id].to_i)
				current_card.count -= 1
				session[:card] = nil if current_card.count == 0
			else
				summ = count * price
				session[:card][:card_item][params[:id].to_i] = {
															:product_id=>product_id,
															:count=>count,
															:price=>price,
															:summ=>summ}
			end
		end
		redirect_to(card_items_url)
	end

  def show
    @card_item = CardItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @card_item }
    end
  end

  # GET /card_items/new
  # GET /card_items/new.xml
  def new
    @card_item = CardItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @card_item }
    end
  end

  # GET /card_items/1/edit
  def edit
    @card_item = CardItem.find(params[:id])
  end

  # POST /card_items
  # POST /card_items.xml


  # PUT /card_items/1
  # PUT /card_items/1.xml
  def update
    @card_item = CardItem.find(params[:id])

    respond_to do |format|
      if @card_item.update_attributes(params[:card_item])
        format.html { redirect_to(@card_item, :notice => 'Card item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @card_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /card_items/1
  # DELETE /card_items/1.xml
  def destroy
    @card_item = CardItem.find(params[:id])
    @card_item.destroy

    respond_to do |format|
      format.html { redirect_to(card_items_url) }
      format.xml  { head :ok }
    end
  end
end
