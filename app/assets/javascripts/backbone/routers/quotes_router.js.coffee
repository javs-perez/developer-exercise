class BenchPrep.Routers.QuotesRouter extends Backbone.Router
  initialize: (options) ->
    @quotes = new BenchPrep.Collections.QuotesCollection()
    @startOfPage = (options.page - 1) * options.per_page
    @endOfPage = options.page * options.per_page
    @quotes.reset options.quotes.slice(@startOfPage, @endOfPage)

  routes:
    "index"    : "index"
    ".*"       : "index"

  index: ->
    @view = new BenchPrep.Views.Quotes.IndexView(collection: @quotes)
    $("#quotes").html(@view.render().el)
