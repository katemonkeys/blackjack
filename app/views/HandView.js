// Generated by CoffeeScript 1.6.3
(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.HandView = (function(_super) {
    __extends(HandView, _super);

    function HandView() {
      _ref = HandView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    HandView.prototype.className = 'hand';

    HandView.prototype.template = _.template('<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>');

    HandView.prototype.initialize = function() {
      var _this = this;
      this.collection.on('add remove change', function() {
        return _this.render();
      });
      this.collection.on('endTurn', function() {
        return _this.render('flag');
      });
      return this.render('flag');
    };

    HandView.prototype.render = function() {
      this.$el.children().detach();
      this.$el.html(this.template(this.collection));
      this.$el.append(this.collection.map(function(card) {
        return new CardView({
          model: card
        }).$el;
      }));
      if (arguments[0] && this.isDealer) {
        return this.$('.score').text(this.collection.scores()[0]);
      } else if (arguments[0]) {
        return this.$('.score').text(this.collection.checkScores());
      } else {
        if (this.collection.scores().length > 1) {
          return this.$('.score').text(this.collection.scores()[0] + " or " + this.collection.scores()[1]);
        } else {
          return this.$('.score').text(this.collection.scores()[0]);
        }
      }
    };

    return HandView;

  })(Backbone.View);

}).call(this);
