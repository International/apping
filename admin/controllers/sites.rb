Admin.controllers :sites do

  get :index do
    @sites = Site.all
    render 'sites/index'
  end

  get :new do
    @site = Site.new
    render 'sites/new'
  end

  post :create do
    req_body = params[:site].delete("request_body")
    @site = Site.new(params[:site])
    @site.request_body = Site.decode(req_body) if req_body.present?
    
    if @site.save
      flash[:notice] = 'Site was successfully created.'
      redirect url(:sites, :edit, :id => @site.id)
    else
      render 'sites/new'
    end
  end

  get :edit, :with => :id do
    @site = Site.find(params[:id])
    render 'sites/edit'
  end

  put :update, :with => :id do
    req_body = params[:site].delete("request_body")
    @site = Site.find(params[:id])
    @site.request_body = Site.decode(req_body) if req_body.present?

    if @site.update_attributes(params[:site])
      flash[:notice] = 'Site was successfully updated.'
      redirect url(:sites, :edit, :id => @site.id)
    else
      render 'sites/edit'
    end
  end

  delete :destroy, :with => :id do
    site = Site.find(params[:id])
    if site.destroy
      flash[:notice] = 'Site was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Site!'
    end
    redirect url(:sites, :index)
  end
end
