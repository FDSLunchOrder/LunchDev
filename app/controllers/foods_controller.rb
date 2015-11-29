class FoodsController < ApplicationController

    before_action :find_food, :only => [:show, :edit, :update, :destroy]

    def index
      @foods = Food.all

      respond_to do |format|
        format.html
        format.csv {send_data @foods.to_csv}
        format.xls {send_data @foods.to_csv(col_sep: "\t") }
      end
    end

    def show
      respond_to do |format|
        format.html
        format.xml { render :xml => @food }
      end
    end

    def new
      @food = Food.new

      respond_to do |format|
        format.html #new.html.erb template
        format.xml { render :xml => @food }
      end
    end

    def create
      @food = Food.new(food_params)

      respond_to do |format|
        if @food.save
          flash[:notice] = 'Food successfully created'
          format.html { redirect_to(@food) }
          format.xml {render :xml => @food, :status => :created, :location => @food }
        else
          format.html { render :action => "new" }
          format.xml {render :xml => @food.errors, :status => :unprocessable_entity}
        end
      end
    end

    def edit

    end

    def update

      respond_to do |format|
        if @food.update_attributes(food_params)
          flash[:notice] = 'Food was successfully updated'
          format.html { redirect_to(@food) }
          format.xml {head :ok}
        else
          format.html { render :action => 'edit' }
          format.xml { render :xml => @food.errors, :status => :unprocessable_entity}
        end
      end
    end

    def destroy

      @food.destroy

      respond_to do |format|
        format.html { redirect_to(foods_url) }
        format.xml { head :ok }
      end

    end

    def import
      Food.import(params[:file])
      redirect_to foods_url, notice: "Foods imported."
    end

    private

    def food_params
      params.require(:food).permit(:restaurant_id, :name, :name2, :active, :price, :price2, :foodType_id)
    end

    def find_food
      @food = Food.find(params[:id])
    end

    def accessible_attributes
      ["restaurant_id", "name", "name2", "active", "price","price2", "foodType_id"]
    end




end
