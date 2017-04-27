<script type="text/javascript">


    function get_action(form) {
        form.action = document.querySelector('input[name = "x"]:checked').value;;
    }


$(".nav a").on("click", function(){
   $(".nav").find(".active").removeClass("active");
   $(this).parent().addClass("active");
});

</script>