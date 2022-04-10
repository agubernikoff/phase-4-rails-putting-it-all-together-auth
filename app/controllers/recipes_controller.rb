class RecipesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    def index
        render json: Recipe.all, status: :created
    end

    def create
        user = User.find(session[:user_id])
        recipe = user.recipes.create!(recipe_params)
        render json: recipe, status: :created

    end

    private

    def recipe_params
        params.permit(:title, :instructions,:minutes_to_complete)
    end

    def render_unprocessable_entity invalid
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
