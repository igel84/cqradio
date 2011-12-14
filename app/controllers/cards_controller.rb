#encoding: utf-8
class CardsController < ApplicationController
  layout 'main_layout', :only =>['new']

  def index
    @cards = Card.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cards }
    end
  end

  # GET /cards/1
  # GET /cards/1.xml
  def show
    @card = Card.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @card }
    end
  end

  # GET /cards/new
  # GET /cards/new.xml
  def new
    @card = Card.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @card }
    end
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
  end

  # POST /cards
  # POST /cards.xml
  def create
		@user = User.create(
							:name=>params[:name],
							:email=>params[:email],
							:phone=>params[:phone],
							:info=>params[:info])

    @card = Card.new
    @card.user = @user
    @card.card_items = []

    session[:card][:card_item].each do |item, item_params|
			@card.card_items << CardItem.new(
	    												:product_id=>item_params[:product_id],
	    												:count=>item_params[:count],
	    												:price=>item_params[:price])
    end
		session[:card] = nil
    if @card.save
    	flash[:notice] = 'Заказ успешно создан, с Вами свяжется наш менеджер'
    	redirect_to(root_path)
    else
    	render :action => "new"
    end
  end

  # PUT /cards/1
  # PUT /cards/1.xml
  def update
    @card = Card.find(params[:id])

    respond_to do |format|
      if @card.update_attributes(params[:card])
        format.html { redirect_to(@card, :notice => 'Card was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.xml
  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to(cards_url) }
      format.xml  { head :ok }
    end
  end
end
