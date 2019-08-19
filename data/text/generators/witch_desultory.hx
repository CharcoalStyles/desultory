usestandardenemies();

var witch_spells = ["Magic Shield", "Magic Missile", "Nudge","Life Drain", "Bandage", "Healing Crystal",
  "Slime Ball", 
  "Magic Dagger", 
  "Fury Spell", 
  "Magic Spear",
  "Hex",
  "Catastrophe","Illuminate", 
  "Glass Cauldron", 
  "Gold Cauldron", 
  "Silver Cauldron", 
  "Skeleton Key",
  "Counter Spell",
  "Rat"];
shuffle(witch_spells);

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

var commonlist_basic = witch_spells.splice(0,3);
shuffle(commonlist_basic);

var commonlist_offensive = witch_spells.splice(0,6);
var commonlist_dicemanipulation = witch_spells.splice(0,6);

if(chance(20)){
  commonlist_dicemanipulation.push("Crucible");
}else{
  commonlist_dicemanipulation.push(pick(commonlist_dicemanipulation));
}

//Floor 1:
items = [commonlist_basic.pop()];
gooditems = [commonlist_basic.pop()];
otherstuff = [];
goodotherstuff = [];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:
commonlist_dicemanipulation = shuffle(commonlist_dicemanipulation);
commonlist_offensive = shuffle(commonlist_offensive);
		
items = [];
		
gooditems = ["Hall of Mirrors"];
otherstuff = [
  health(), 
  health()
];

goodotherstuff = [
  shop(shuffle([commonlist_offensive.pop(), "Magic Key",  commonlist_basic.pop()]))
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  	
//Floor 3:
items = [commonlist_dicemanipulation.pop()];
gooditems = [commonlist_offensive.pop()];
		
otherstuff = [
  health(), 
  health()
];

goodotherstuff = [
  shop(shuffle([commonlist_offensive.pop(), "Health", commonlist_dicemanipulation.pop()]), [2, 3, 4])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
items = [];
gooditems = [rand([commonlist_dicemanipulation.pop(), commonlist_offensive.pop()])];
		
shuffle(commonlist_dicemanipulation);
shuffle(commonlist_offensive);
		
otherstuff = [
  health(),
  health()
];
goodotherstuff = [
  shop(shuffle(["Lightning Bolt", "Inferno", "Blizzard"]), [3, 4, 5])
];
		
addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [];
gooditems = [];
otherstuff = [health(), health(), health()];
goodotherstuff = [
  shop(shuffle(
    [
      rand(["Burning Light", "Ice Shard", "Sonic Wave", "Absolute Zero", "Meteor"]), 
      commonlist_offensive.pop(), 
      "Health"
    ]))
];
		
addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 6:
items = [];
gooditems = [];
otherstuff = [];
goodotherstuff = [];

var lastfloor = addfloor("boss");

if (getfinalboss() == "Drake"){
  items.push("Wooden Stake");
}

lastfloor
  .additems(items, gooditems)
  .setlocation('BOSS')
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();