class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :update, :destroy]

  # GET /evaluations
  # GET /evaluations.json
  def index
    @evaluations = Evaluation.all

    render json: @evaluations
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
    render json: @evaluation
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)

    if @evaluation.save
      render json: @evaluation, status: :created, location: @evaluation
    else
      render json: @evaluation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    @evaluation = Evaluation.find(params[:id])

    if @evaluation.update(evaluation_params)
      head :no_content
    else
      render json: @evaluation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    @evaluation.destroy

    head :no_content
  end


  # POST /evaluations/:evaluation_id/add_rating
  # POST /evaluations/:evaluation_id/add_rating.json
  def add_rating
    
    #the key into the redis array of ratings
    evaluation_id = params[:evaluation_id]
    user_id = params[:user_id]
    rating_value = params[:rating_value]

    #the rating that will be stored in redis
    rating = {
      "user_id": user_id,
      "rating_value": rating_value
    }

    #add the rating to the set mapped to by the evaluation id
    $redis.sadd("evaluation" + evaluation_id, user_id + ":" + rating_value)

    head :no_content
  end

  # POST /evaluations/:evaluation_id/complete
  # POST /evaluations/:evaluation_id/complete.json
  def complete

    #the key into the redis array of ratings
    evaluation_id = params[:evaluation_id]

    #get the evaluation
    evaluation = Evaluation.find(params[:evaluation_id])

    #get the array of ratings from redis based on the evaluation id
    ratings = $redis.smembers("evaluation" + evaluation_id)

    #ratings will be of the form ["user_id:ratingvalue",...]
    #ex: ["1:excellent","2:good","3:okay","4:horrible"]

    #iterate over all ratings
    ratings.each do |rating_map|

      rating = rating_map.split(":")
      user_id = rating[0]
      rating_value = rating[1]

      evaluation.ratings.new(:user_id => user_id, :rating_value => rating_value)
    end

    if evaluation.save!
      #clear the redis key if the evaluation has been saved
      $redis.del("evaluation" + evaluation_id)
    end
  end


  private

    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    def evaluation_params
      params.require(:evaluation).permit(:evaluation_template_id)
    end

end
