check = {}

new Promise( (succ, fail)=>{

    $.ajax({
    url: "./ajax1.php",  
    type: "POST",
    data: { bs_num: bs_num },
    success: function(result) {
        check.code = result.b_stt_cd;
        check.b_no = result.b_no;
        succ(result);
        //console.log(result);

    },
    fail: function(result) {
        console.log(result.responseText);
        fail(error); 
    }
});

}).then((arg) =>{  

    $.ajax({
        url: './ajax2.php',
        type: 'post',
        data: { bs_num: bs_num },
        success: function(result2) {

            if(result2 > 0) {
                alert("이미 가입하였습니다.");
            } else {
                if(check.code == "01") {
                    $("#result").val(check.b_no);
                } else {
                    $("#result").val(check.b_no);
                }  
            }  
            
           //console.log(result2);


       }                                               

    });

});

