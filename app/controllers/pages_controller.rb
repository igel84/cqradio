#encoding: utf-8
class PagesController < ApplicationController
  #layout "main_layout", :only => 'category, show'
  layout "application", :except => 'category, show'

	def find
		if params[:text] != ''
			@menus = []
			@products = Product.find(:all, :conditions=>['name like ?', "%" + params[:text] + "%"])
			render 'category', :layout=>'main_layout'
		else
			redirect_to :root
		end
	end

  def category
  	if params[:id]
  		@menu = Menu.find(params[:id])
			@menus = @menu.children.where(:visible=>true)
			@products = @menu.products
		else
			@menus = Menu.roots.where(:visible=>true)
			@products = Product.where(:menu_id=>nil)
		end
		render 'category', :layout=>'main_layout'
  end

  def index
    @pages = Page.all
	end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])
		render 'show', :layout=>'main_layout'
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to(@page, :notice => 'Page was successfully created.') }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to(pages_path, :notice => 'Page was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
  end
end
