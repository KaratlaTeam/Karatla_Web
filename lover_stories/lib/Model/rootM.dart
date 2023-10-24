

class RM{
  RM({
    this.tick = 0,
});
  int tick;
}

class FirstPageTrans{
  FirstPageTrans({
   this.trans = 0,
    this.dialog = false,

});
  int trans;
  bool dialog;
}

class TimeLine{
  TimeLine({
    this.year = 2018,
    this.open = true,
    this.memory = '',
    this.stepper = 0,
  });
  int year;
  bool open;
  String memory;
  int stepper;
}