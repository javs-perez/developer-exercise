Array.include CoreExtensions::Array::Where

class ArraySearchesController < ApplicationController
  def new
  end

  def create
    array = JSON.parse params[:array_of_hashes]
    query = JSON.parse params[:query]

    @results = array.where(query)
  end
end
