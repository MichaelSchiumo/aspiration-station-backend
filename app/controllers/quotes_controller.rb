   class QuotesController < ApplicationController
     before_action :set_quote, only: [:update, :destroy]

      def index
        @quotes = Quote.all
        render json: QuoteSerializer.new(@quotes), include: [:dreamer]
      end

      def create

        @dreamer = Dreamer.create(name: quote_params[:name], age: quote_params[:age], sex: quote_params[:sex])

        @quote = @dreamer.quotes.build(author: quote_params[:author], content: quote_params[:content])

        if @quote.save
          render json: {quote: @quote}
          # json_response(@song, :created)
        else
          render json: { message: 'Quote was not created.'}
        end
      end

      def show
        @quote = Quote.find_by(id: params[:id])
        render json: QuoteSerializer.new(@quote), include: [:dreamer]
      end

      def update
        @quote.update(quote_params)
      end

      def destroy
        @quote.destroy
        render json: { message: 'Quote was deleted.' }
      end

      private

      def quote_params
        params.require(:quote).permit(:content, :author, :dreamer_id, :age, :sex, :name)
      end

      def set_quote
        @quote = Quote.find_by(id: params[:id])
      end
    end
