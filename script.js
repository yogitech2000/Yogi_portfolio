const terminal = document.getElementById("terminal");

const promptText = "portfolio@yogaganapathi:~$ ";

let commandHistory = [];
let historyIndex = -1;

const commands = {

help: `
Available Commands

help                 Show all commands
profile              View my profile summary
skills               List my technical skills
experience           Show work experience
experience tcs       TCS roles and responsibilities
experience trimble   Trimble responsibilities
social               My social links
clear / cls          Clear terminal
`,

profile: `
DevOps / Site Reliability Engineer with 4+ years of experience
in automation, cloud infrastructure, and CI/CD pipelines.

Focused on reliability engineering, automation and observability.

Location: Chennai, India
`,

skills: `
Technical Skills

Cloud
AWS
Azure

DevOps
CI/CD
Azure DevOps
Jenkins

Containers
Docker
Kubernetes

Automation
Ansible
Python
PowerShell

Infrastructure
Terraform
IaC

Monitoring
New Relic
BigPanda
Moogsoft

Other
Linux
Windows
Git/GitHUb
DNS
SQL
`,

experience: `
Total Experience: 4+ Years

Trimble Inc
Site Reliability Engineer

Tata Consultancy Services
Devops Engineer

Type:

experience trimble
experience tcs

to know more
`,

"experience tcs": `
Tata Consultancy Services - Devops Engineer

Responsibilities

• Built reusable Ansible automation templates
• Automated SQL database health checks
• Reduced operational effort by 70%
• Managed AWS EC2, IAM and Auto Scaling
• Configured AWS Security Groups
• Maintained Route53 DNS records
• Created incident response runbooks
`,

"experience trimble": `
Trimble Inc — Site Reliability Engineer

Responsibilities

• Designed monitoring dashboards using New Relic
• Reduced MTTR by 40% through troubleshooting
• Automated Azure VM health checks
• Implemented container backup audits
• Managed Kubernetes clusters
• Built automation workflows using Azure DevOps
• Improved deployment time by 50%
`,

social: `
LinkedIn
https://linkedin.com/in/yogaganapathi-p

Email
yogaganapathi23042000@gmail.com

GitHub
https://github.com/yogitech2000
`

};

function createPrompt(){

const line = document.createElement("div");
line.classList.add("line");

const prompt = document.createElement("span");
prompt.classList.add("prompt");
prompt.textContent = promptText;

const input = document.createElement("input");
input.classList.add("terminal-input");
input.type = "text";
input.autocomplete = "off";

const cursor = document.createElement("span");
cursor.classList.add("cursor");
cursor.textContent = "█";

line.appendChild(prompt);
line.appendChild(input);
line.appendChild(cursor);

terminal.appendChild(line);

// Auto scroll to bottom when new prompt is created
setTimeout(() => {
    terminal.scrollTop = terminal.scrollHeight;
}, 10);

input.focus();

let currentInput = "";

input.addEventListener("input", function(e) {
    currentInput = input.value;
});

input.addEventListener("keydown", function(e){

if(e.key === "Enter"){

const command = input.value.trim().toLowerCase();

if(command && !commandHistory.includes(command)){
    commandHistory.push(command);
}
historyIndex = -1;

input.disabled = true;
cursor.style.display = "none";

if(command === "clear" || command === "cls"){
terminal.innerHTML="";
printOutput("Welcome to Yogaganapathi Terminal Portfolio\nType 'help' to see commands\n");
createPrompt();
return;
}

if(commands[command]){
printOutput(commands[command]);
}
else{
printOutput("Command not found.\nType 'help' to see available commands.");
}

createPrompt();

}
else if(e.key === "ArrowUp"){
e.preventDefault();
if(historyIndex < commandHistory.length - 1){
    historyIndex++;
    input.value = commandHistory[commandHistory.length - 1 - historyIndex];
    currentInput = input.value;
}
}
else if(e.key === "ArrowDown"){
e.preventDefault();
if(historyIndex > 0){
    historyIndex--;
    input.value = commandHistory[commandHistory.length - 1 - historyIndex];
    currentInput = input.value;
}
else if(historyIndex === 0){
    historyIndex = -1;
    input.value = "";
    currentInput = "";
}
}

});

// Keep focus on input when clicking anywhere in terminal
terminal.addEventListener("click", function() {
    input.focus();
});

}

function printOutput(text){

const output = document.createElement("div");
output.classList.add("output");

// Add smooth typing effect for output
let index = 0;
output.textContent = "";

const typeWriter = () => {
    if (index < text.length) {
        output.textContent += text.charAt(index);
        index++;
        setTimeout(typeWriter, 5); // Adjust speed here
    } else {
        // Auto scroll to bottom after output is complete
        setTimeout(() => {
            terminal.scrollTop = terminal.scrollHeight;
        }, 100);
    }
};

terminal.appendChild(output);
typeWriter();

}

printOutput("Welcome to Yogaganapathi Terminal Portfolio\nType 'help' to see commands\n");

createPrompt();