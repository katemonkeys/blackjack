describe "hands", ->
  deck = null
  player = null
  dealer = null

  beforeEach ->
    deck = new Deck()
    player = deck.dealPlayer()
    dealer = deck.dealDealer()

  describe 'has we?', ->
    it "we has.", ->
      expect(player).toBeDefined()
      expect(dealer.length).toEqual 2
    it "the right number of cards", ->
      expect(player.length).toEqual 2
      player.hit()
      expect(player.length).toEqual 3
    # it "should not hit after bust", ->

  describe 'they render', ->
    it 'yes they do', ->
      spyOn(HandView.prototype, 'render').andCallThrough()
      handview = new HandView({collection: player})
      console.log(HandView)
      expect(HandView.prototype.render()).toHaveBeenCalled()