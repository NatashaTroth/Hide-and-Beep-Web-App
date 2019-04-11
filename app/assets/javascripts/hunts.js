// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener('turbolinks:load', function(){
    let noTimeLimitCheckbox = document.querySelector(".js-hunt-form-no-time-limit-checkbox")
    let setTimeLimitInputDiv = document.querySelector(".js-hunt-form-set-time-limit")

    if(noTimeLimitCheckbox != null){
        //for first load and reload
        toggleSetTimeLimit()
        
        noTimeLimitCheckbox.addEventListener("click", toggleSetTimeLimit)
    }


    function toggleSetTimeLimit(){
        if(noTimeLimitCheckbox.checked){
            setTimeLimitInputDiv.classList.add("visibility-hidden")
            setTimeLimitInputDiv.classList.remove("visibility-visible")

        }
        else{
            setTimeLimitInputDiv.classList.add("visibility-visible")
            setTimeLimitInputDiv.classList.remove("visibility-hidden")
        }
    }    
});