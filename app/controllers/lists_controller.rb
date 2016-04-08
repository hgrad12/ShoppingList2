class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  def show_lists
   @types_id = Type.find(params[:id])
    type = Type.find(@types_id)
    @lists = type.lists
    @lists = where(@types_id)
  end
  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
    #@lists = @type.lists
  end
#url_for(controller: 'lists_item', action: new_lists, id: type_id)
  def new_list
    @lists = List.new
    @types_id = Type.find(params[:id])
    @lists.type_id = @types_id
  end
  # GET /lists/1
  # GET /lists/1.json
  def show
    @lists = List.find(params[:id])
  end

  def addIdValue
    @type = Type.find(params[:id])

  end

  # GET /lists/new
  def new
    #@lists = List.find(params[:id])
    @types = Type.find_by_id(params[:id])
    #@lists.type_id = @types_id
    @lists = List.new
    @lists.type_id = @types
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    # @type = Type.new(type_params)
    #@type = Type.find(params[:id])
    @types = Type.find_by_id(params[:type_id])
    @lists = List.new(list_params)

    respond_to do |format|
      if @lists.save
        format.html { redirect_to @lists, notice: 'Type was successfully created.' }
        format.json { render :show, status: :created, location: @lists }
      else
        format.html { render :new }
        format.json { render json: @lists.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @lists.update(list_params)
        format.html { redirect_to @lists, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @lists }
      else
        format.html { render :edit }
        format.json { render json: @lists.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @lists.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @lists = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :quantity, :type_id)
    end
end
