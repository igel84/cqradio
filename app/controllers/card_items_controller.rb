class CardItemsController < ApplicationController
  layout 'main_layout'

	def create
    current_card == nil ? session[:card] = Card.new : current_card
    current_card.card_items << CardItem.new(:product_id=>params[:product_id])
  end

  def index
  	if current_card
	    @card_items = current_card.card_items
	  else
	  	@card_items = nil
	  end
  end

	def card_clear
		if params[:product_id]
			current_card.card_items.each do |item|
				item.destroy if item.product_id == params[:product_id]
			end
		else
			session[:card] = nil
		end
		redirect_to(card_items_url)
	end

  # GET /card_items/1
  # GET /card_items/1.xml
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
