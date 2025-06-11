




document.addEventListener("DOMContentLoaded", function (){
	
	
	
  const input = document.getElementById("searchIn");
  input.addEventListener("input", filtertab);

  function filtertab() {
    const filter = input.value.toUpperCase();
    const table = document.querySelector("table");
    const tr = table.getElementsByTagName("tr");

    for (let i = 1; i < tr.length; i++) { 
      const td = tr[i].getElementsByTagName("td");
      let rowContainsFilter = false;

      for (let j = 0; j < td.length; j++) {
        const tvalue = td[j].textContent || td[j].innerText;
        if (tvalue.toUpperCase().indexOf(filter) > -1) {
          rowContainsFilter = true;
          break;
        }
      }

      tr[i].style.display = rowContainsFilter ? "" : "none";
    }
  }
});






function enablebox(){
	
	if(document.getElementById("chkbx").checked){
		
		document.getElementById("updatebutton1").disabled=false;
	}
	else{
		
		document.getElementById("updatebutton1").disabled=true;
	}
	
}





window.onload = function() {
       			 document.getElementById("aForm").submit();
    };


	


function confirmAdd() {
    return confirm("Are you confirm you want to submit this application?");
}





function confirmdelete() {
    return confirm("Are you confirm you want to delete this application?");
}



function confirmEdit() {
    return confirm("Are you confirm you want to Edit this application?");
}


