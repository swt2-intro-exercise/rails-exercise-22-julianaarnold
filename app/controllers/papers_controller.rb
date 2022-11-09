class PapersController < ApplicationController
  before_action :set_paper, only: %i[ show edit update destroy ]

  # GET /papers
  def index
    @papers = Paper.all
  end

  # GET /papers/1
  def show
  end

  # GET /papers/new
  def new
    @paper = Paper.new
  end

  # GET /papers/1/edit
  def edit
  end

  # POST /papers
  def create
    @paper = Paper.new(paper_params)

    if @paper.save
      redirect_to @paper, notice: "Paper was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /papers/1
  def update
    if @paper.update(paper_params)
      redirect_to @paper, notice: "Paper was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /papers/1
  def destroy
    @paper.destroy
    redirect_to papers_url, notice: "Paper was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = Paper.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paper_params
      params.require(:paper).permit(:title, :venue, :year, :author_ids => [])
    end
end
