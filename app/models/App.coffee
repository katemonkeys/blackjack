#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on  'endTurn', @newTurn, @
    undefined

  newTurn: ->
    console.log(@get 'dealerHand')
    @get('dealerHand').models[0].set('revealed', true)
    alert 'Dealer wins; you bust'

# @set('currentSong', new Song() );
#Also within initialize:
# params.library.on('enqueue', function(song) {
  #this.get('songQueue').add(song);},this)}