function updateResults () {
		var checkboxes = $(".checkbox:checked");
		var tags = $("#keywords");
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

  $('#demo').offset({
    top: ($(window).height() - $('#demo').height()) / 2
  });

	var tags = $(".tag");
	console.log(tags);
	tags.click(function(e) {
    e.preventDefault();
    var key = $('#keywords');
    key.val(key.val() + ' ' + $(e.target).text().trim());
    updateResults();
  });

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

/* ===================================================================

 * スムーススクロール

=================================================================== */
$(function(){
   // #で始まるアンカーをクリックした場合に処理
   $('a[href^=#]').click(function() {
      // スクロールの速度
      var speed = 400;// ミリ秒
      // アンカーの値取得
      var href= $(this).attr("href");
      // 移動先を取得
      var target = $(href == "#" || href == "" ? 'html' : href);
      // 移動先を数値で取得
      var position = target.offset().top;
      // スムーススクロール
      $($.browser.safari ? 'body' : 'html').animate({scrollTop:position}, speed, 'swing');
      return false;
   });
});



// アイコン切り替え、mosueover

icon1 = new Image();
icon1.src = "/assets/flower-icon-blown.png";
 function brown1(){document.icon1.src="/assets/flower-icon-brown.png";}
 function white1(){document.icon1.src="/assets/flower-icon-white.png";}

icon2 = new Image();
icon2.src = "/assets/toilet-icon-blown.png";
 function brown2(){document.icon2.src="/assets/toilet-icon-brown.png";}
 function white2(){document.icon2.src="/assets/toilet-icon-white.png";}

icon3 = new Image();
icon3.src = "/assets/water-icon-blown.png";
 function brown3(){document.icon3.src="/assets/water-icon-brown.png";}
 function white3(){document.icon3.src="/assets/water-icon-white.png";}

icon4 = new Image();
icon4.src = "/assets/bench-icon-blown.png";
 function brown4(){document.icon4.src="/assets/bench-icon-brown.png";}
 function white4(){document.icon4.src="/assets/bench-icon-white.png";}

icon5 = new Image();
icon5.src = "/assets/parking-icon-blown.png";
 function brown5(){document.icon5.src="/assets/parking-icon-brown.png";}
 function white5(){document.icon5.src="/assets/parking-icon-white.png";}

icon6 = new Image();
icon6.src = "/assets/sports-icon-blown.png";
 function brown6(){document.icon6.src="/assets/sports-icon-brown.png";}
 function white6(){document.icon6.src="/assets/sports-icon-white.png";}

icon7 = new Image();
icon7.src = "/assets/playground-icon-blown.png";
 function brown7(){document.icon7.src="/assets/playground-icon-brown.png";}
 function white7(){document.icon7.src="/assets/playground-icon-white.png";}


//onclick---icon underline

function closePopUp() {
  fukidashi.style.display = "none";
}
function openPopUp() {
  closePopUp();
  fukidashi.style.display = "block";
}

function closePopUp2() {
  fukidashi2.style.display = "none";
}
function openPopUp2() {
  closePopUp();
  fukidashi2.style.display = "block";
}

function closePopUp3() {
  fukidashi3.style.display = "none";
}
function openPopUp3() {
  closePopUp();
  fukidashi3.style.display = "block";
}

function closePopUp4() {
  fukidashi4.style.display = "none";
}
function openPopUp4() {
  closePopUp();
  fukidashi4.style.display = "block";
}

function closePopUp5() {
  fukidashi5.style.display = "none";
}
function openPopUp5() {
  closePopUp();
  fukidashi5.style.display = "block";
}

function closePopUp6() {
  fukidashi6.style.display = "none";
}
function openPopUp6() {
  closePopUp();
  fukidashi6.style.display = "block";
}

function closePopUp7() {
  fukidashi7.style.display = "none";
}
function openPopUp7() {
  closePopUp();
  fukidashi7.style.display = "block";
}

