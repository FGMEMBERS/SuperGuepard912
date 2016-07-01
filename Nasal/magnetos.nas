# ===========================
# Magneots by Helijah    2016
#And 5H1N0B1 2016 ;-)
# ===========================

var m0 = props.globals.getNode("/controls/engines/engine[0]/mag0", 1);
var m1 = props.globals.getNode("/controls/engines/engine[0]/mag1", 1);
var magnetos = props.globals.getNode("/controls/engines/engine[0]/magnetos", 1);

var InitListener = setlistener("/sim/signals/fdm-initialized", func {
    settimer(UpdateAllumage, 5.0);
    removelistener(InitListener);
});

var UpdateAllumage = func {
    settimer(superguepard.On_Off_allumage, 0);
}

var On_Off_allumage = func(){
  var mag0 = m0.getValue()?1:0;
  var mag1 = m1.getValue()?1:0;
 
  var MyStringOfBits = mag0 ~mag1;
  var MyStringOfBitsInInt = bits.value(MyStringOfBits);

  #print(MyStringOfBits);
  #print(MyStringOfBitsInInt);
  #print(mag1);
  magnetos.setValue(MyStringOfBitsInInt);
  
  superguepard.UpdateAllumage();
}

#print("m0 .... : ", m0);
#print("m1 .... : ", m1);
