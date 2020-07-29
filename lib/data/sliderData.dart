class SliderModel{

 String imagePath;
  String sliderTitle;
  String sliderDesc;

 SliderModel({this.imagePath, this.sliderTitle, this.sliderDesc});


// SliderModel();
  void setImagePath(String path){
    imagePath =path;
  }
  String getImagePath(){
    return imagePath;
  }
  void setSliderTitle(String title){
    sliderTitle = title;
  }
  String getSliderTitle(){
    return sliderTitle;
  }
 void setSliderDesc(String description){
    sliderDesc= description;
 }
 String getSliderDesc(){
    return sliderDesc;
 }
 
  List<SliderModel>getSlides(){

    List<SliderModel> slider = new List<SliderModel>();
    SliderModel model = new SliderModel();
    
    // slider 1
    model.setImagePath("assets/slider_one.jpg");
    model.setSliderTitle("Effectively form an habit");
    model.setSliderDesc("Habtrack app is simple habit tracker that helps shape your habits and helps you get rid of old habits, with habtrack app we help you achieve your goals and reflect on your life");
    slider.add(model);

    // slider2
    model = new SliderModel();
    model.setImagePath("assets/slider_two.jpg");
    model.setSliderTitle("Track your habit with\n reminders");
    model.setSliderDesc("Habtrack is perfect to make sure you are on track of your goals, and that you are \nconsistent with what you need to do");
    slider.add(model);

    // slider 3
    model = new SliderModel();
    model.setImagePath("assets/slider_three.jpg");
    model.setSliderTitle("Simple and easy to use");
    model.setSliderDesc("Habtrack is built with focus on simplicity and ease of use with emphasis on it core feature.");
    slider.add(model);

    return slider;
  }
}