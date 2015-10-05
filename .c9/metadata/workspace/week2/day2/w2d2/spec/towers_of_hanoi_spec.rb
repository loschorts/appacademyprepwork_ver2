{"filter":false,"title":"towers_of_hanoi_spec.rb","tooltip":"/week2/day2/w2d2/spec/towers_of_hanoi_spec.rb","undoManager":{"mark":1,"position":1,"stack":[[{"start":{"row":0,"column":0},"end":{"row":1,"column":0},"action":"insert","lines":["",""],"id":2}],[{"start":{"row":0,"column":0},"end":{"row":40,"column":0},"action":"insert","lines":["# Towers of Hanoi","#","# Write a Towers of Hanoi game:","# http://en.wikipedia.org/wiki/Towers_of_hanoi","#","# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array","# of three arrays. Each subarray should represent a tower. Each tower should","# store integers representing the size of its discs. Expose this instance","# variable with an `attr_reader`.","#","# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what","# pile to select a disc from. The pile should be the index of a tower in your","# `@towers` array. Use gets","# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp/) to get an","# answer. Similarly, find out which pile the user wants to move the disc to.","# Next, you'll want to do different things depending on whether or not the move","# is valid. Finally, if they have succeeded in moving all of the discs to","# another pile, they win! The loop should end.","#","# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on","# this, just get it playable.","#","# Think about what other helper methods you might want. Here's a list of all the","# instance methods I had in my TowersOfHanoi class:","# * initialize","# * play","# * render","# * won?","# * valid_move?(from_tower, to_tower)","# * move(from_tower, to_tower)","#","# Make sure that the game works in the console. There are also some specs to","# keep you on the right track:","#","# ```bash","# bundle exec rspec spec/towers_of_hanoi_spec.rb","# ```","#","# Make sure to run bundle install first! The specs assume you've implemented the","# methods named above.",""],"id":3}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":8,"column":33},"end":{"row":8,"column":33},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1443811292262,"hash":"43f8c986ab42b152c04b1744dd0048b4e60926c1"}