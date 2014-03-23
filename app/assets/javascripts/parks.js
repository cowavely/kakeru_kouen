function updateResults () {
		var checkboxes = $(".checkbox:checked");
		var tags = $("#tags");
		var region = $("#region");
		var flags = {};
		checkboxes.each (function(){
			var flag = $(this).attr("name");
			flag = flag.substring(8, flag.length - 1);
			flags[flag]="1";
		});
		var params = {
			region: region.val(),
			flags: flags,
			tags: tags.val()
		};
		console.log(params);

		// send params to search and get response 
		$.get("/search", params, function(response){
			console.log(response);
			$("#resultNum").text(response.count);
		}, "json");
}

$(function() {
	var checkboxes = $(".checkbox");
	console.log(checkboxes);
	checkboxes.click(updateResults);

	var tags = $(".tag");
	console.log(tags);
	tags.click(updateResults);

	var region = $("#region");
	console.log(region);
	region.change(updateResults);

	var clearButton = $("#clear-button");
	console.log(region);
	clearButton.click(function(e){
		e.preventDefault();
		var tagField = $("#tags");
		tagField.val("");
		updateResults();
	});

});

/*
{
        "utf8" => "✓",
      "region" => "南部",
       "flags" => {
    "has_toilet" => "1"
  },
        "tags" => " 流山総合運動公園 ",
      "commit" => "見る",
      "action" => "search",
  "controller" => "parks"
}
*/