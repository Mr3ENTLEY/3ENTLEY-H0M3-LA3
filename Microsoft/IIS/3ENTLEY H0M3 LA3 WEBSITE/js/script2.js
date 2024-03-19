// script.js
document.addEventListener('DOMContentLoaded', (event) => {
    const element = document.getElementById('typing2');
    const textToType = 'THANK YOU FOR PLAYING';

    element.innerText = ''; // Clear the existing text
    let index = 0;
    
    function typeEffect() {
        if (index < textToType.length) {
            element.innerText += textToType.charAt(index);
            index++;
            setTimeout(typeEffect, 150); // Adjust typing speed as necessary
        } else {
            element.style.borderRight = 'none'; // Removes the cursor after typing
            terminal.classList.add('fade-in'); // Start the fade-in effect for the terminal
        }
    }

    setTimeout(typeEffect, 1000); // Start typing effect after a delay when the DOM is fully loaded
    
});
