
    function setActiveMenuItem() {
        // Get the current URL path
        const currentPath = window.location.pathname;
        
    
        document.querySelectorAll('.menu-item').forEach(item => {
            item.classList.remove('active');
        });
        
        // Set active 
        if (currentPath.includes('/dashboard')) {
            document.getElementById('navop1').classList.add('active');
        } else if (currentPath.includes('/transfer')) {
            document.getElementById('navop2').classList.add('active');
        } else if (currentPath.includes('/account')) {
            document.getElementById('navop3').classList.add('active');
        } else if (currentPath.includes('/transaction')) {
            document.getElementById('navop4').classList.add('active');
        } else if (currentPath.includes('/payees')) {
            document.getElementById('navop5').classList.add('active');
        } else if (currentPath.includes('/readservlet')) {
            document.getElementById('navop6').classList.add('active');
        } else if (currentPath.includes('/contact')) {
            document.getElementById('navop7').classList.add('active');
        } else if (currentPath.includes('/Profile.jsp') || currentPath.includes('/Update.jsp')) {
            // Fix the ID for profile menu item
            document.querySelector('.menu-item:has(.material-icons:contains("person"))').classList.add('active');
        }
    }
    

    document.querySelectorAll('.menu-item').forEach(item => {
        item.addEventListener('click', function() {

            document.querySelectorAll('.menu-item').forEach(menuItem => {
                menuItem.classList.remove('active');
            });
            

            this.classList.add('active');
        });
    });
    

    document.addEventListener('DOMContentLoaded', setActiveMenuItem);

//Button redirection
document.getElementById('logout').addEventListener('click', function() {
    window.location.href='${pageContext.request.contextPath}/Logout';
});

document.getElementById('logoutTop').addEventListener('click', function() {
    window.location.href='${pageContext.request.contextPath}/Logout';
});


document.getElementById('settings').addEventListener('click', function() {
    window.location.href='${pageContext.request.contextPath}/Profile.jsp';
});

document.getElementById('logout').addEventListener('click', function() {
    window.location.href='${pageContext.request.contextPath}/Logout';
});

document.getElementById('logoutTop').addEventListener('click', function() {
    window.location.href='${pageContext.request.contextPath}/Logout';
});




