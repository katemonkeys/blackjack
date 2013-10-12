class window.AppView extends Backbone.View

  template: _.template '
    <div class="game-wrapper">
    <div class="title">Cards Against Humanity</div>
    <button class="hit-button">Hit</button>
    <button class="stand-button">Stand</button>
    <button class="deal-button">Deal</button>
    <button class="shuffle-button">Shuffle deck</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    </div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()
    "click .deal-button": -> 
      @model.newGame()
      @render()
    "click .shuffle-button": -> 
      @model.initialize()
      @render()

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
