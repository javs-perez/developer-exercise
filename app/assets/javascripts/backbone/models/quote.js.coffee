class BenchPrep.Models.Quote extends Backbone.Model
  paramRoot: 'quote'

  defaults:
    source: null
    context: null
    quote: null
    theme: null

class BenchPrep.Collections.QuotesCollection extends Backbone.Collection
  model: BenchPrep.Models.Quote
  url: '/quotes'
