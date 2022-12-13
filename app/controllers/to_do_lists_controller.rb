class ToDoListsController < ApplicationController
  before_action :set_to_do_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /to_do_lists
  # GET /to_do_lists.json
  def index
    @to_do_lists = ToDoList.all
  end

  # GET /to_do_lists/1
  # GET /to_do_lists/1.json
  def show
  end

  # GET /to_do_lists/new
  def new
    @to_do_list = ToDoList.new
  end

  # GET /to_do_lists/1/edit
  def edit
	@to_do_lists = ToDoList.all
  end

  # POST /to_do_lists
  # POST /to_do_lists.json
  def create
    @to_do_list = ToDoList.create(user: current_user.email, date: params["date"], work: params["work"])

    respond_to do |format|
      if @to_do_list.save
        format.html { redirect_to '/to_do_lists', notice: 'To do list was successfully created.' }
        format.json { render :show, status: :created, location: @to_do_list }
      else
        format.html { render :new }
        format.json { render json: @to_do_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /to_do_lists/1
  # PATCH/PUT /to_do_lists/1.json
  def update
    respond_to do |format|
      if @to_do_list.update(user: current_user.email, work: params["work"])
        format.html { redirect_to '/to_do_lists', notice: 'To do list was successfully updated.' }
        format.json { render :show, status: :ok, location: @to_do_list }
      else
        format.html { render :edit }
        format.json { render json: @to_do_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /to_do_lists/1
  # DELETE /to_do_lists/1.json
  def destroy
    @to_do_list.destroy
    respond_to do |format|
      format.html { redirect_to to_do_lists_url, notice: 'To do list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_do_list
      @to_do_list = ToDoList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def to_do_list_params
	  ToDoList.create(user: current_user.email, date: params["date"], work: params["work"])
    end
end
