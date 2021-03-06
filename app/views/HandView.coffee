class window.HandView extends Backbone.View

  className: 'hand'

  #todo: switch to mustache
  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @collection.on 'endTurn', => @render('flag')
    @render('flag')

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    if arguments[0] and @isDealer
      @$('.score').text @collection.scores()[0]
    else if arguments[0]
      @$('.score').text @collection.checkScores()
    else
      if @collection.scores().length > 1
        @$('.score').text @collection.scores()[0] + " or " + @collection.scores()[1]
      else @$('.score').text @collection.scores()[0]
