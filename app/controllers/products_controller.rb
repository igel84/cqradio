class ProductsController < ApplicationController
  
    def del_image
      @product = Product.find(params[:id])
      @image = Image.find(params[:image])
      @image.destroy
      #@product.images.where(:id=>params[:image]).destroy
      redirect_to :controller=>'products', :action=>'edit', :id => @product.id, :parent_id => @product.menu_id
    end
    
    def move
    @product = Product.find(params[:id])
    case params[:position]
      when 'up'
        Product.find(params[:id]).move_higher #(params[:id]).move_left if @product != Product.where(:menu_id=>@product.menu_id).order('lft').first
      when 'down'
        Product.find(params[:id]).move_lower #.move_right if @product != Product.where(:menu_id=>@product.menu_id).order('lft').last
      when 'first'
        #while @product != Product.where(:menu_id=>@product.menu_id).order('lft').first
          Product.find(params[:id]).move_to_top #.move_left
        #end
      when 'last'
        #while @product != Product.where(:menu_id=>@product.menu_id).order('lft').last
          Product.find(params[:id]).move_to_bottom #.move_right
        #end
    end
    redirect_to :controller=>'menus', :action=>'index', :parent_id => @product.menu_id
  end

  # GET /products
  # GET /products.xml
  def index
    @products = Product.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new(:menu_id=>params[:parent_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])
    @product.position = Product.all.size + 1
    respond_to do |format|
      if @product.save
        format.html { redirect_to :controller=>'menus', :action=>'index', :parent_id => @product.menu_id }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])
    #фото
    if params[:photos]
      params[:photos].each do |photo|
        image = Image.new(:photo=>photo)
        @product.images << image
      end
      @product.save
    end
        
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to  :controller=>'menus', :action=>'index', :parent_id => @product.menu_id }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    menu_id =  @product.menu_id
    @product.destroy

    respond_to do |format|
      format.html { redirect_to :controller=>'menus', :action=>'index', :parent_id => menu_id }
      format.xml  { head :ok }
    end
  end
end