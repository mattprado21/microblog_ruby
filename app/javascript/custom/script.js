$(window).on("load", function() {
    "use strict";

    //  ============= EDIT POST COMMENT FUNCTION =========
    
    $('.edit-comment').on("click", function(e){
        //prevent page from loading
        e.preventDefault();
        var element = $(this);
        var commentId = element.attr("id");
        var postId = element.attr("data-post_id");
        var commentContent = element.attr("data-comment");

        $("#editCommentForm").attr("action", "/posts/" + postId + "/comments/" + commentId);
        $("#commentId").val(commentId);
        $("#commentContent").val(commentContent);
        $("#submitComment").prop('id', 'submitEditedComment');
        $('#editComments').modal('show');
    });

    /**
     * Image preview
     * 
     * @param {object} input 
     */
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                // for edit post
                if ($('#img_prev_edit').length) {
                    $('#img_prev_edit').remove();
                }
                $('#img_prev').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    // ============== CREATE POST ==================
    $('#createPostBtn').on("click", function(e){
        //prevent page from loading
        e.preventDefault();
        $('#createPost').modal('show');
    });
    
    $("#postImage").change(function() {
        $('#img_prev').removeClass('hidden');
        readURL(this);
    });
      
    // ============== Update profile ==================
    $('#updateProfileImageBtn').on("click", function(e){
        //prevent page from loading
        e.preventDefault();
        $('#updateProfileImage').modal('show');
    });

    $("#profileImage").change(function() {
        $('#img_prev').removeClass('hidden');
        readURL(this);
    });

    //  ============= SIGNIN SWITCH TAB FUNCTIONALITY =========

    $(document).ready(function() {
        if ($('.pagination').length) {
          $(window).scroll(function() {
            var url = $('.pagination .next_page').attr('href');
            if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
              $('.pagination').text("Please Wait...");
              return $.getScript(url);
            }
          });
          return $(window).scroll();
        }
    });

    //  ============= COVER GAP FUNCTION =========

    var gap = $(".container").offset().left;
    $(".cover-sec > a, .chatbox-list").css({
        "right": gap
    });

    //  ============= OVERVIEW EDIT FUNCTION =========

    $(".overview-open").on("click", function(){
        $("#overview-box").addClass("open");
        $(".wrapper").addClass("overlay");
        return false;
    });
    $(".close-box").on("click", function(){
        $("#overview-box").removeClass("open");
        $(".wrapper").removeClass("overlay");
        return false;
    });

    //  ============= EXPERIENCE EDIT FUNCTION =========

    $(".exp-bx-open").on("click", function(){
        $("#experience-box").addClass("open");
        $(".wrapper").addClass("overlay");
        return false;
    });
    $(".close-box").on("click", function(){
        $("#experience-box").removeClass("open");
        $(".wrapper").removeClass("overlay");
        return false;
    });

    //  ============= EDUCATION EDIT FUNCTION =========

    $(".ed-box-open").on("click", function(){
        $("#education-box").addClass("open");
        $(".wrapper").addClass("overlay");
        return false;
    });
    $(".close-box").on("click", function(){
        $("#education-box").removeClass("open");
        $(".wrapper").removeClass("overlay");
        return false;
    });

    //  ============= LOCATION EDIT FUNCTION =========

    $(".lct-box-open").on("click", function(){
        $("#location-box").addClass("open");
        $(".wrapper").addClass("overlay");
        return false;
    });
    $(".close-box").on("click", function(){
        $("#location-box").removeClass("open");
        $(".wrapper").removeClass("overlay");
        return false;
    });

    //  ============= SKILLS EDIT FUNCTION =========

    $(".skills-open").on("click", function(){
        $("#skills-box").addClass("open");
        $(".wrapper").addClass("overlay");
        return false;
    });
    $(".close-box").on("click", function(){
        $("#skills-box").removeClass("open");
        $(".wrapper").removeClass("overlay");
        return false;
    });

    //  ============= ESTABLISH EDIT FUNCTION =========

    $(".esp-bx-open").on("click", function(){
        $("#establish-box").addClass("open");
        $(".wrapper").addClass("overlay");
        return false;
    });
    $(".close-box").on("click", function(){
        $("#establish-box").removeClass("open");
        $(".wrapper").removeClass("overlay");
        return false;
    });

    //  ============= CREATE PORTFOLIO FUNCTION =========

    $(".gallery_pt > a").on("click", function(){
        $("#create-portfolio").addClass("open");
        $(".wrapper").addClass("overlay");
        return false;
    });
    $(".close-box").on("click", function(){
        $("#create-portfolio").removeClass("open");
        $(".wrapper").removeClass("overlay");
        return false;
    });

    //  ============= EMPLOYEE EDIT FUNCTION =========

    $(".emp-open").on("click", function(){
        $("#total-employes").addClass("open");
        $(".wrapper").addClass("overlay");
        return false;
    });
    $(".close-box").on("click", function(){
        $("#total-employes").removeClass("open");
        $(".wrapper").removeClass("overlay");
        return false;
    });

    //  =============== Ask a Question Popup ============

    $(".ask-question").on("click", function(){
        $("#question-box").addClass("open");
        $(".wrapper").addClass("overlay");
        return false;
    });
    $(".close-box").on("click", function(){
        $("#question-box").removeClass("open");
        $(".wrapper").removeClass("overlay");
        return false;
    });

    //  ================== Edit Options Function =================


    $(".ed-opts-open").on("click", function(){
        $(this).next(".ed-options").toggleClass("active");
        return false;
    });


    // ============== Menu Script =============

    $(".menu-btn > a").on("click", function(){
        $("nav").toggleClass("active");
        return false;
    });


    //  ============ Notifications Open =============

    $(".not-box-open").on("click", function(){
        $(this).next(".notification-box").toggleClass("active");
    });

    // ============= User Account Setting Open ===========

    $(".user-info").on("click", function(){
        $(this).next(".user-account-settingss").toggleClass("active");
    });

    //  ============= FORUM LINKS MOBILE MENU FUNCTION =========

    $(".forum-links-btn > a").on("click", function(){
        $(".forum-links").toggleClass("active");
        return false;
    });
    $("html").on("click", function(){
        $(".forum-links").removeClass("active");
    });
    $(".forum-links-btn > a, .forum-links").on("click", function(){
        e.stopPropagation();
    });
});


