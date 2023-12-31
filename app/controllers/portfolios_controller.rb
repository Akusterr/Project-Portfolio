class PortfoliosController < ApplicationController
  layout "portfolio"
  # access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all


    def index 
        @portfolio_items = Portfolio.all
    end

    def new 
        @portfolio_item = Portfolio.new
        3.times { @portfolio_item.technologies.build }
    end

    def create
        @portfolio_item = Portfolio.new(portfolio_params)
        
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_url(@portfolio_item), notice: "Your portfolio item is now live." }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])


    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_url(@portfolio_item), notice: "The record succcessfully updated" }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show 
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    #Perform the lookup
    @portfolio_item = Portfolio.find(params[:id])

    #Destroy/delete the record
    @portfolio_item.destroy

    #Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Portfolio was successfully destroyed." }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle,  
                                      :body, 
                                      technologies_attributes: [:name])
  end


end
