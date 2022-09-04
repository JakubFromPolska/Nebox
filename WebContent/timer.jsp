<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script>

	if (localStorage.getItem("noleggio") != null) {
		var start = document.getElementById('strt');
		if (localStorage.getItem("sec") != null) {
			var sec = localStorage.getItem("sec") ;
			var min = localStorage.getItem("min") ; 
			var hrs = localStorage.getItem("ore") ; 	
		} else {
			sec = 0 ; 
			min = 0 ; 
			hrs = 0 ; 
		}
		var t;

		function tick() {
			sec++;
			if (sec >= 60) {
				sec = 0;
				min++;
				if (min >= 60) {
					min = 0;
					hrs++;
				}
			}
			localStorage.setItem("sec", sec) ;
			localStorage.setItem("min", min) ;
			localStorage.setItem("ore", hrs) ;			
		}		
		function add() {
			tick();
			timer();
		}
		function timer() {
			t = setTimeout(add, 1000);
		}
		timer();
		start.onclick = timer;		
	}
</script>