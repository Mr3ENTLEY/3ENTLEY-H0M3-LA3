// script.js
document.addEventListener('DOMContentLoaded', (event) => {
    const element = document.getElementById('typing');
    const textToType = '3ENTLEY$ H0M3 LA3';
    const terminalInput = document.getElementById('terminalInput');
    const submitButton = document.getElementById('submitCode');
    const output = document.getElementById('output');
    const terminal = document.querySelector('.terminal');
    const correctCode = "cmd/:>/enter3entley"; // Replace with your actual code

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

    terminalInput.addEventListener('keydown', function(event) {
        if (event.key === 'Enter') {
            processCommand(terminalInput.value);
            terminalInput.value = ''; // Clear the input
        }
    });

    submitButton.addEventListener('click', function() {
        processCommand(terminalInput.value);
    });

    function processCommand(command) {
        output.textContent += '\n$ ' + command;
        if (command === correctCode) {
            window.location.href = 'pagetwo.html'; // Use the correct relative path
        } else {
            output.textContent += '\nAccess Denied: Incorrect Code';
        }
    }
});
