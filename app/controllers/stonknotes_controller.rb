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
      format.turbo_stream do
        render(turbo_stream: turbo_stream.append(:stonknotes_content,
                                                 partial: 'stonknotes/stonknotes',
                                                 locals: { stonknotes: @result }))
      end
      format.html
    end
  end

end
