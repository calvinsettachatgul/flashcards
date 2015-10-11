$(document).ready(function(){

  test();

  var buttonCreateLorem = $('.create_lorem');
  var buttonEditCard = $('.button_to_edit');

  // button.on('click', function(event){
  //   event.preventDefault();
  //   console.log(event);
  // });

  buttonCreateLorem.on('click', createLoremCard);

  buttonEditCard.on('click', showEditForm);

})

var showEditForm = function(event){
  event.preventDefault();
  var id = event.target.id
  getCard(id);
}

var showTemplate = function(data){
  var source   = $("#entry-template").html();

  if(source){
  var template = Handlebars.compile(source);
  var context = data;
  var html    = template(context);
  return html;
  }
}

var getEditForm = function(data){
  var source   = $("#edit-card-template").html();

  if(source){
  var template = Handlebars.compile(source);
  var context = data;
  var html    = template(context);
  return html;
  }
}

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
      method: 'post',
      data: {"flashcard": flashcard},
    });

    request.done(function(response){
        //append the card to the list
    });

};

var getCard = function(id){

  var url = '/flashcards/' + id;

  var request = $.ajax({
      url: url,
      method: 'get',
      dataType: 'json',
    });
  request.done(function(response){
      console.log(response);
      var html = getEditForm(response);
      var flashcard_found = response;


      // var html = getEditForm({name: response.name,
      //                     description: response.description,
      //                     question: response.question,
      //                     answer: response,
      //                     tags: "tags",});

  console.log(flashcard_found);


  var editCardFormArea = $(".editCardFormArea");



  editCardFormArea.prepend(html);

  });

  return "got the card"

}



var test = function(){
  console.log("hello");
}