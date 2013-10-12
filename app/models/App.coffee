#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'endTurn', @newTurn, @
    # @.on
    undefined

  newTurn: ->
    # console.log 'starting newTurn'
    dh = @get('dealerHand')
    ph = @get('playerHand')
    dh.models[0].set('revealed', true)
    if ph.checkScores() > 21 then alert 'Dealer wins!'
    else
      while dh.checkScores() < 17
        dh.hit()
      if dh.checkScores() > 21 then alert 'Dealer busts. You win!'
      else if dh.checkScores() > ph.checkScores() then alert 'Dealer wins!'
      else if dh.checkScores() == ph.checkScores() then alert 'Push.'
      else alert 'You win!'
    undefined

  newGame: ->
    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()
    # @trigger('handDealt')
    @get('playerHand').on 'endTurn', @newTurn, @
    undefined


# array!!!!
# TODO   alert 'Dealer wins with #{points}; you bust with #{somestuff}'

