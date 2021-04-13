class StonknotesController < ApplicationController

  def index
    @result =
      Stonknote
      .all
      .then { |q| params[:cursor].present? ? q.where('id < ?', params[:cursor]) : q }
      .order(id: :desc)
      .first(20)
      .map { |sn| StonknotePresenter.new(sn) }

    respond_to do |format|
      format.turbo_stream { render(layout: false) }
      format.html
    end
  end

end
