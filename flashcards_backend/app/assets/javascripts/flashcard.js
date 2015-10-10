$(document).ready(function(){

  test();

  var button = $('.create_lorem');

  // button.on('click', function(event){
  //   event.preventDefault();
  //   console.log(event);
  // });

  button.on('click', createLoremCard);


})

var createLoremCard = function(event){
    event.preventDefault();

    var new_lorem_ul = $('.new_lorem');

    var flashcard = {};

    flashcard.name = $(".lorem_name").html();
    flashcard.description = $(".lorem_description").html();
    flashcard.question = $(".lorem_question").html();
    flashcard.answer = $(".lorem_answer").html();
    flashcard.tags = $(".lorem_tags").html();
    console.log(flashcard);


    var request = $.ajax({
      url: '/flashcards',
      type: 'post',
      data: {"flashcard": flashcard},
    });

    request.done(function(response){

    });

};


var test = function(){
  console.log("hello");
}